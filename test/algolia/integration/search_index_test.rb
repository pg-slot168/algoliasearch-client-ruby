require 'httpclient'
require_relative 'base_test'

class SearchIndexTest < BaseTest
  describe 'customize search client' do
    def test_with_custom_adapter
      client = Algolia::Search::Client.new(@@search_config, http_requester: Algolia::Http::HttpRequester, adapter: 'httpclient')
      index  = client.init_index(get_test_index_name('test_custom_adapter'))

      index.save_object!({name: 'test', data: 10}, opts: {auto_generate_object_id_if_not_exist: true})
      response = index.search('test')

      refute_empty response['hits']
      assert_equal 'test', response['hits'][0]['name']
      assert_equal 10, response['hits'][0]['data']
    end

    def test_with_custom_requester
      client = Algolia::Search::Client.new(@@search_config, http_requester: MockRequester)
      index  = client.init_index(get_test_index_name('test_custom_requester'))

      response = index.search('test')

      refute_nil response['hits']
    end

    def test_without_providing_config
      client   = Algolia::Search::Client.create(APPLICATION_ID_1, ADMIN_KEY_1)
      index    = client.init_index(get_test_index_name('test_no_config'))
      index.save_object!({name: 'test', data: 10}, opts: {auto_generate_object_id_if_not_exist: true})
      response = index.search('test')

      refute_empty response['hits']
      assert_equal 'test', response['hits'][0]['name']
      assert_equal 10, response['hits'][0]['data']
    end
  end

  describe 'save objects' do
    def before_all
      super
      @index = @@search_client.init_index(get_test_index_name('indexing'))
    end

    def test_save_object_without_object_id_and_fail
      exception = assert_raises ArgumentError do
        @index.save_object(generate_object)
      end

      assert_equal "Missing 'objectID'", exception.message
    end

    def test_save_object_with_object_id
      response = @index.save_object(generate_object('111'))

      assert_equal ['111'], response['objectIDs']
      refute_nil response['taskID']
    end

    def test_save_object_with_object_id_and_auto_generate_object_id_if_not_exist
      response = @index.save_object(generate_object('111'), opts: {auto_generate_object_id_if_not_exist: true})

      assert_equal ['111'], response['objectIDs']
      refute_nil response['taskID']
    end

    def test_save_object_with_object_id_and_request_options
      response = @index.save_object(generate_object('111'), opts: {headers: {'X-Forwarded-For': '0.0.0.0'}})

      assert_equal ['111'], response['objectIDs']
      refute_nil response['taskID']
    end

    def test_save_object_without_object_id
      response = @index.save_object(generate_object, opts: {auto_generate_object_id_if_not_exist: true})

      refute_empty response['objectIDs']
      refute_nil response['taskID']
    end

    def test_save_objects_with_single_object_and_fail
      exception = assert_raises ArgumentError do
        @index.save_objects(generate_object)
      end

      assert_equal 'argument must be an array of objects', exception.message
    end

    def test_save_objects_with_array_of_integers_and_fail
      exception = assert_raises ArgumentError do
        @index.save_objects([2222, 3333])
      end

      assert_equal 'argument must be an array of object, got: 2222', exception.message
    end

    def test_save_objects_with_empty_array
      response = @index.save_objects([])

      refute_nil response['taskID']
    end

    def test_save_objects_with_object_id
      response = @index.save_objects([
                                       generate_object('111'),
                                       generate_object('222')
                                     ])

      assert_equal %w(111 222), response['objectIDs']
      refute_nil response['taskID']
    end

    def test_save_objects_without_object_id
      response = @index.save_objects([
                                       generate_object,
                                       generate_object
                                     ], opts: {auto_generate_object_id_if_not_exist: true})

      refute_empty response['objectIDs']
      refute_nil response['taskID']
    end

    def test_batch_save_objects
      ids     = []
      objects = []
      1.upto(8).map do |i|
        id = (i + 1).to_s
        objects << generate_object(id)
        ids << id
      end

      batch = @index.save_objects(objects)
      @index.wait_task(batch['taskID'])
    end
  end

  describe 'search' do
    def before_all
      super
      @index = @@search_client.init_index(get_test_index_name('search'))
      @index.save_objects!(create_employee_records, opts: {auto_generate_object_id_if_not_exist: true})
      @index.set_settings!(attributesForFaceting: ['searchable(company)'])
    end

    def test_search_objects
      response = @index.search('algolia')

      assert_equal 2, response['nbHits']
      assert_equal 0, Algolia::Search::Index.get_object_position(response, 'nicolas-dessaigne')
      assert_equal 1, Algolia::Search::Index.get_object_position(response, 'julien-lemoine')
      assert_equal(-1, Algolia::Search::Index.get_object_position(response, ''))
    end

    def find_objects
      exception = assert_raises Algolia::AlgoliaApiError do
        @index.find_object(opts: {query: '', paginate: false})
      end

      assert_equal 'Object not found', exception.message

      exception = assert_raises Algolia::AlgoliaApiError do
        @index.find_object(opts: {query: '', paginate: false}) { false }
      end

      assert_equal 'Object not found', exception.message

      response = @index.find_object(opts: {query: '', paginate: false}) { true }
      assert_equal 0, response[:position]
      assert_equal 0, response[:page]

      # we use a lambda and convert it to a block with `&`
      # so as not to repeat the condition
      condition = -> (obj) do
        obj.has_key?('company') && obj['company'] == 'Apple'
      end

      exception = assert_raises Algolia::AlgoliaApiError do
        @index.find_object(opts: {query: 'algolia', paginate: false}, &condition)
      end

      assert_equal 'Object not found', exception.message

      exception = assert_raises Algolia::AlgoliaApiError do
        @index.find_object(opts: {query: '', paginate: false, hitsPerPage: 5}, &condition)
      end

      assert_equal 'Object not found', exception.message

      response = @index.find_object(opts: {query: '', paginate: true, hitsPerPage: 5}, &condition)
      assert_equal 0, response[:position]
      assert_equal 2, response[:page]
    end

    def test_search_with_click_analytics
      response = @index.search('elon', opts: {clickAnalytics: true})

      refute_nil response['queryID']
    end

    def test_search_with_facet_filters
      response = @index.search('elon', opts: {facets: '*', facetFilters: ['company:tesla']})

      assert_equal 1, response['nbHits']
    end

    def test_search_with_filter
      response = @index.search('elon', opts: {facets: '*', filters: '(company:tesla OR company:spacex)'})

      assert_equal 2, response['nbHits']
    end

    def test_search_for_facet_values
      response = @index.search_for_facet_values('company', 'a')

      assert(response['facetHits'].any? { |hit| hit['value'] == 'Algolia' })
      assert(response['facetHits'].any? { |hit| hit['value'] == 'Amazon' })
      assert(response['facetHits'].any? { |hit| hit['value'] == 'Apple' })
      assert(response['facetHits'].any? { |hit| hit['value'] == 'Arista Networks' })
    end
  end
end