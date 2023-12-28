# Code generated by OpenAPI Generator (https://openapi-generator.tech), manual changes will be lost - read more on https://github.com/algolia/api-clients-automation. DO NOT EDIT.

module Algolia
  class QuerySuggestionsClient
    attr_accessor :api_client

    def initialize(config = nil)
      raise '`config` must be provided' if config.nil?
      raise '`config.app_id` must be provided' if config.app_id.nil? || config.app_id == ''
      raise '`config.api_key` must be provided' if config.api_key.nil? || config.api_key == ''

      @api_client = Algolia::ApiClient.new(config)
    end

    def self.create(app_id, api_key, region = nil)
      hosts = []
      regions = ['eu', 'us']

      raise "`region` is required and must be one of the following: #{regions.join(', ')}" if region.nil? || (region != '' && !regions.include?(region))

      hosts << Transport::StatefulHost.new('query-suggestions.{region}.algolia.com'.sub!('{region}', region), accept: CallType::READ | CallType::WRITE)

      config = Algolia::Configuration.new(app_id, api_key, hosts, 'QuerySuggestions')
      create_with_config(config)
    end

    def self.create_with_config(config)
      new(config)
    end

    # Create a configuration.
    # Create a new Query Suggestions configuration.  You can have up to 100 configurations per Algolia application.
    # @param query_suggestions_configuration_with_index [QuerySuggestionsConfigurationWithIndex]  (required)
    # @param request_options: The request options to send along with the query, they will be merged with the transporter base parameters (headers, query params, timeouts, etc.). (optional)
    # @return [Http::Response] the response
    def create_config_with_http_info(query_suggestions_configuration_with_index, request_options = {})
      # verify the required parameter 'query_suggestions_configuration_with_index' is set
      if @api_client.config.client_side_validation && query_suggestions_configuration_with_index.nil?
        raise ArgumentError, "Missing the required parameter 'query_suggestions_configuration_with_index' when calling QuerySuggestionsClient.create_config"
      end

      path = '/1/configs'
      query_params = {}
      query_params = query_params.merge(request_options[:query_params]) unless request_options[:query_params].nil?
      header_params = {}
      header_params = header_params.merge(request_options[:header_params]) unless request_options[:header_params].nil?

      post_body = request_options[:debug_body] || @api_client.object_to_http_body(query_suggestions_configuration_with_index)

      new_options = request_options.merge(
        :operation => :'QuerySuggestionsClient.create_config',
        :header_params => header_params,
        :query_params => query_params,
        :body => post_body,
        :use_read_transporter => false
      )

      @api_client.call_api(:POST, path, new_options)
    end

    # Create a configuration.
    # Create a new Query Suggestions configuration.  You can have up to 100 configurations per Algolia application.
    # @param query_suggestions_configuration_with_index [QuerySuggestionsConfigurationWithIndex]  (required)
    # @param request_options: The request options to send along with the query, they will be merged with the transporter base parameters (headers, query params, timeouts, etc.). (optional)
    # @return [BaseResponse]
    def create_config(query_suggestions_configuration_with_index, request_options = {})
      response = create_config_with_http_info(query_suggestions_configuration_with_index, request_options)
      deserialize(response.body, request_options[:debug_return_type] || 'QuerySuggestions::BaseResponse')
    end

    # Send requests to the Algolia REST API.
    # This method allow you to send requests to the Algolia REST API.
    # @param path [String] Path of the endpoint, anything after \&quot;/1\&quot; must be specified. (required)
    # @param parameters [Hash<String, Object>] Query parameters to apply to the current query.
    # @param request_options: The request options to send along with the query, they will be merged with the transporter base parameters (headers, query params, timeouts, etc.). (optional)
    # @return [Http::Response] the response
    def custom_delete_with_http_info(path, parameters = nil, request_options = {})
      # verify the required parameter 'path' is set
      if @api_client.config.client_side_validation && path.nil?
        raise ArgumentError, "Missing the required parameter 'path' when calling QuerySuggestionsClient.custom_delete"
      end

      path = '/1{path}'.sub('{' + 'path' + '}', path.to_s)
      query_params = {}
      query_params = query_params.merge(parameters) unless parameters.nil?
      query_params = query_params.merge(request_options[:query_params]) unless request_options[:query_params].nil?
      header_params = {}
      header_params = header_params.merge(request_options[:header_params]) unless request_options[:header_params].nil?

      post_body = request_options[:debug_body]

      new_options = request_options.merge(
        :operation => :'QuerySuggestionsClient.custom_delete',
        :header_params => header_params,
        :query_params => query_params,
        :body => post_body,
        :use_read_transporter => false
      )

      @api_client.call_api(:DELETE, path, new_options)
    end

    # Send requests to the Algolia REST API.
    # This method allow you to send requests to the Algolia REST API.
    # @param path [String] Path of the endpoint, anything after \&quot;/1\&quot; must be specified. (required)
    # @param parameters [Hash<String, Object>] Query parameters to apply to the current query.
    # @param request_options: The request options to send along with the query, they will be merged with the transporter base parameters (headers, query params, timeouts, etc.). (optional)
    # @return [Object]
    def custom_delete(path, parameters = nil, request_options = {})
      response = custom_delete_with_http_info(path, parameters, request_options)
      deserialize(response.body, request_options[:debug_return_type] || 'Object')
    end

    # Send requests to the Algolia REST API.
    # This method allow you to send requests to the Algolia REST API.
    # @param path [String] Path of the endpoint, anything after \&quot;/1\&quot; must be specified. (required)
    # @param parameters [Hash<String, Object>] Query parameters to apply to the current query.
    # @param request_options: The request options to send along with the query, they will be merged with the transporter base parameters (headers, query params, timeouts, etc.). (optional)
    # @return [Http::Response] the response
    def custom_get_with_http_info(path, parameters = nil, request_options = {})
      # verify the required parameter 'path' is set
      if @api_client.config.client_side_validation && path.nil?
        raise ArgumentError, "Missing the required parameter 'path' when calling QuerySuggestionsClient.custom_get"
      end

      path = '/1{path}'.sub('{' + 'path' + '}', path.to_s)
      query_params = {}
      query_params = query_params.merge(parameters) unless parameters.nil?
      query_params = query_params.merge(request_options[:query_params]) unless request_options[:query_params].nil?
      header_params = {}
      header_params = header_params.merge(request_options[:header_params]) unless request_options[:header_params].nil?

      post_body = request_options[:debug_body]

      new_options = request_options.merge(
        :operation => :'QuerySuggestionsClient.custom_get',
        :header_params => header_params,
        :query_params => query_params,
        :body => post_body,
        :use_read_transporter => false
      )

      @api_client.call_api(:GET, path, new_options)
    end

    # Send requests to the Algolia REST API.
    # This method allow you to send requests to the Algolia REST API.
    # @param path [String] Path of the endpoint, anything after \&quot;/1\&quot; must be specified. (required)
    # @param parameters [Hash<String, Object>] Query parameters to apply to the current query.
    # @param request_options: The request options to send along with the query, they will be merged with the transporter base parameters (headers, query params, timeouts, etc.). (optional)
    # @return [Object]
    def custom_get(path, parameters = nil, request_options = {})
      response = custom_get_with_http_info(path, parameters, request_options)
      deserialize(response.body, request_options[:debug_return_type] || 'Object')
    end

    # Send requests to the Algolia REST API.
    # This method allow you to send requests to the Algolia REST API.
    # @param path [String] Path of the endpoint, anything after \&quot;/1\&quot; must be specified. (required)
    # @param parameters [Hash<String, Object>] Query parameters to apply to the current query.
    # @param body [Object] Parameters to send with the custom request.
    # @param request_options: The request options to send along with the query, they will be merged with the transporter base parameters (headers, query params, timeouts, etc.). (optional)
    # @return [Http::Response] the response
    def custom_post_with_http_info(path, parameters = nil, body = nil, request_options = {})
      # verify the required parameter 'path' is set
      if @api_client.config.client_side_validation && path.nil?
        raise ArgumentError, "Missing the required parameter 'path' when calling QuerySuggestionsClient.custom_post"
      end

      path = '/1{path}'.sub('{' + 'path' + '}', path.to_s)
      query_params = {}
      query_params = query_params.merge(parameters) unless parameters.nil?
      query_params = query_params.merge(request_options[:query_params]) unless request_options[:query_params].nil?
      header_params = {}
      header_params = header_params.merge(request_options[:header_params]) unless request_options[:header_params].nil?

      post_body = request_options[:debug_body] || @api_client.object_to_http_body(body)

      new_options = request_options.merge(
        :operation => :'QuerySuggestionsClient.custom_post',
        :header_params => header_params,
        :query_params => query_params,
        :body => post_body,
        :use_read_transporter => false
      )

      @api_client.call_api(:POST, path, new_options)
    end

    # Send requests to the Algolia REST API.
    # This method allow you to send requests to the Algolia REST API.
    # @param path [String] Path of the endpoint, anything after \&quot;/1\&quot; must be specified. (required)
    # @param parameters [Hash<String, Object>] Query parameters to apply to the current query.
    # @param body [Object] Parameters to send with the custom request.
    # @param request_options: The request options to send along with the query, they will be merged with the transporter base parameters (headers, query params, timeouts, etc.). (optional)
    # @return [Object]
    def custom_post(path, parameters = nil, body = nil, request_options = {})
      response = custom_post_with_http_info(path, parameters, body, request_options)
      deserialize(response.body, request_options[:debug_return_type] || 'Object')
    end

    # Send requests to the Algolia REST API.
    # This method allow you to send requests to the Algolia REST API.
    # @param path [String] Path of the endpoint, anything after \&quot;/1\&quot; must be specified. (required)
    # @param parameters [Hash<String, Object>] Query parameters to apply to the current query.
    # @param body [Object] Parameters to send with the custom request.
    # @param request_options: The request options to send along with the query, they will be merged with the transporter base parameters (headers, query params, timeouts, etc.). (optional)
    # @return [Http::Response] the response
    def custom_put_with_http_info(path, parameters = nil, body = nil, request_options = {})
      # verify the required parameter 'path' is set
      if @api_client.config.client_side_validation && path.nil?
        raise ArgumentError, "Missing the required parameter 'path' when calling QuerySuggestionsClient.custom_put"
      end

      path = '/1{path}'.sub('{' + 'path' + '}', path.to_s)
      query_params = {}
      query_params = query_params.merge(parameters) unless parameters.nil?
      query_params = query_params.merge(request_options[:query_params]) unless request_options[:query_params].nil?
      header_params = {}
      header_params = header_params.merge(request_options[:header_params]) unless request_options[:header_params].nil?

      post_body = request_options[:debug_body] || @api_client.object_to_http_body(body)

      new_options = request_options.merge(
        :operation => :'QuerySuggestionsClient.custom_put',
        :header_params => header_params,
        :query_params => query_params,
        :body => post_body,
        :use_read_transporter => false
      )

      @api_client.call_api(:PUT, path, new_options)
    end

    # Send requests to the Algolia REST API.
    # This method allow you to send requests to the Algolia REST API.
    # @param path [String] Path of the endpoint, anything after \&quot;/1\&quot; must be specified. (required)
    # @param parameters [Hash<String, Object>] Query parameters to apply to the current query.
    # @param body [Object] Parameters to send with the custom request.
    # @param request_options: The request options to send along with the query, they will be merged with the transporter base parameters (headers, query params, timeouts, etc.). (optional)
    # @return [Object]
    def custom_put(path, parameters = nil, body = nil, request_options = {})
      response = custom_put_with_http_info(path, parameters, body, request_options)
      deserialize(response.body, request_options[:debug_return_type] || 'Object')
    end

    # Delete a configuration.
    # Delete a Query Suggestions configuration.  Deleting only removes the configuration and stops updates to the Query Suggestions index. The Query Suggestions index itself is not deleted.
    # @param index_name [String] Query Suggestions index name. (required)
    # @param request_options: The request options to send along with the query, they will be merged with the transporter base parameters (headers, query params, timeouts, etc.). (optional)
    # @return [Http::Response] the response
    def delete_config_with_http_info(index_name, request_options = {})
      # verify the required parameter 'index_name' is set
      if @api_client.config.client_side_validation && index_name.nil?
        raise ArgumentError, "Missing the required parameter 'index_name' when calling QuerySuggestionsClient.delete_config"
      end

      path = '/1/configs/{indexName}'.sub('{' + 'indexName' + '}', @api_client.encode_uri(index_name.to_s))
      query_params = {}
      query_params = query_params.merge(request_options[:query_params]) unless request_options[:query_params].nil?
      header_params = {}
      header_params = header_params.merge(request_options[:header_params]) unless request_options[:header_params].nil?

      post_body = request_options[:debug_body]

      new_options = request_options.merge(
        :operation => :'QuerySuggestionsClient.delete_config',
        :header_params => header_params,
        :query_params => query_params,
        :body => post_body,
        :use_read_transporter => false
      )

      @api_client.call_api(:DELETE, path, new_options)
    end

    # Delete a configuration.
    # Delete a Query Suggestions configuration.  Deleting only removes the configuration and stops updates to the Query Suggestions index. The Query Suggestions index itself is not deleted.
    # @param index_name [String] Query Suggestions index name. (required)
    # @param request_options: The request options to send along with the query, they will be merged with the transporter base parameters (headers, query params, timeouts, etc.). (optional)
    # @return [BaseResponse]
    def delete_config(index_name, request_options = {})
      response = delete_config_with_http_info(index_name, request_options)
      deserialize(response.body, request_options[:debug_return_type] || 'QuerySuggestions::BaseResponse')
    end

    # List configurations.
    # List all Query Suggestions configurations of your Algolia application.
    # @param request_options: The request options to send along with the query, they will be merged with the transporter base parameters (headers, query params, timeouts, etc.). (optional)
    # @return [Http::Response] the response
    def get_all_configs_with_http_info(request_options = {})
      path = '/1/configs'
      query_params = {}
      query_params = query_params.merge(request_options[:query_params]) unless request_options[:query_params].nil?
      header_params = {}
      header_params = header_params.merge(request_options[:header_params]) unless request_options[:header_params].nil?

      post_body = request_options[:debug_body]

      new_options = request_options.merge(
        :operation => :'QuerySuggestionsClient.get_all_configs',
        :header_params => header_params,
        :query_params => query_params,
        :body => post_body,
        :use_read_transporter => false
      )

      @api_client.call_api(:GET, path, new_options)
    end

    # List configurations.
    # List all Query Suggestions configurations of your Algolia application.
    # @param request_options: The request options to send along with the query, they will be merged with the transporter base parameters (headers, query params, timeouts, etc.). (optional)
    # @return [Array<QuerySuggestionsConfigurationResponse>]
    def get_all_configs(request_options = {})
      response = get_all_configs_with_http_info(request_options)
      deserialize(response.body, request_options[:debug_return_type] || 'Array<QuerySuggestions::QuerySuggestionsConfigurationResponse>')
    end

    # Get a configuration.
    # Get a single Query Suggestions configuration.
    # @param index_name [String] Query Suggestions index name. (required)
    # @param request_options: The request options to send along with the query, they will be merged with the transporter base parameters (headers, query params, timeouts, etc.). (optional)
    # @return [Http::Response] the response
    def get_config_with_http_info(index_name, request_options = {})
      # verify the required parameter 'index_name' is set
      if @api_client.config.client_side_validation && index_name.nil?
        raise ArgumentError, "Missing the required parameter 'index_name' when calling QuerySuggestionsClient.get_config"
      end

      path = '/1/configs/{indexName}'.sub('{' + 'indexName' + '}', @api_client.encode_uri(index_name.to_s))
      query_params = {}
      query_params = query_params.merge(request_options[:query_params]) unless request_options[:query_params].nil?
      header_params = {}
      header_params = header_params.merge(request_options[:header_params]) unless request_options[:header_params].nil?

      post_body = request_options[:debug_body]

      new_options = request_options.merge(
        :operation => :'QuerySuggestionsClient.get_config',
        :header_params => header_params,
        :query_params => query_params,
        :body => post_body,
        :use_read_transporter => false
      )

      @api_client.call_api(:GET, path, new_options)
    end

    # Get a configuration.
    # Get a single Query Suggestions configuration.
    # @param index_name [String] Query Suggestions index name. (required)
    # @param request_options: The request options to send along with the query, they will be merged with the transporter base parameters (headers, query params, timeouts, etc.). (optional)
    # @return [QuerySuggestionsConfigurationResponse]
    def get_config(index_name, request_options = {})
      response = get_config_with_http_info(index_name, request_options)
      deserialize(response.body, request_options[:debug_return_type] || 'QuerySuggestions::QuerySuggestionsConfigurationResponse')
    end

    # Get configuration status.
    # Report the status of a Query Suggestions index.
    # @param index_name [String] Query Suggestions index name. (required)
    # @param request_options: The request options to send along with the query, they will be merged with the transporter base parameters (headers, query params, timeouts, etc.). (optional)
    # @return [Http::Response] the response
    def get_config_status_with_http_info(index_name, request_options = {})
      # verify the required parameter 'index_name' is set
      if @api_client.config.client_side_validation && index_name.nil?
        raise ArgumentError, "Missing the required parameter 'index_name' when calling QuerySuggestionsClient.get_config_status"
      end

      path = '/1/configs/{indexName}/status'.sub('{' + 'indexName' + '}', @api_client.encode_uri(index_name.to_s))
      query_params = {}
      query_params = query_params.merge(request_options[:query_params]) unless request_options[:query_params].nil?
      header_params = {}
      header_params = header_params.merge(request_options[:header_params]) unless request_options[:header_params].nil?

      post_body = request_options[:debug_body]

      new_options = request_options.merge(
        :operation => :'QuerySuggestionsClient.get_config_status',
        :header_params => header_params,
        :query_params => query_params,
        :body => post_body,
        :use_read_transporter => false
      )

      @api_client.call_api(:GET, path, new_options)
    end

    # Get configuration status.
    # Report the status of a Query Suggestions index.
    # @param index_name [String] Query Suggestions index name. (required)
    # @param request_options: The request options to send along with the query, they will be merged with the transporter base parameters (headers, query params, timeouts, etc.). (optional)
    # @return [GetConfigStatus200Response]
    def get_config_status(index_name, request_options = {})
      response = get_config_status_with_http_info(index_name, request_options)
      deserialize(response.body, request_options[:debug_return_type] || 'QuerySuggestions::GetConfigStatus200Response')
    end

    # Get logs.
    # Get the logs for a single Query Suggestions index.
    # @param index_name [String] Query Suggestions index name. (required)
    # @param request_options: The request options to send along with the query, they will be merged with the transporter base parameters (headers, query params, timeouts, etc.). (optional)
    # @return [Http::Response] the response
    def get_log_file_with_http_info(index_name, request_options = {})
      # verify the required parameter 'index_name' is set
      if @api_client.config.client_side_validation && index_name.nil?
        raise ArgumentError, "Missing the required parameter 'index_name' when calling QuerySuggestionsClient.get_log_file"
      end

      path = '/1/logs/{indexName}'.sub('{' + 'indexName' + '}', @api_client.encode_uri(index_name.to_s))
      query_params = {}
      query_params = query_params.merge(request_options[:query_params]) unless request_options[:query_params].nil?
      header_params = {}
      header_params = header_params.merge(request_options[:header_params]) unless request_options[:header_params].nil?

      post_body = request_options[:debug_body]

      new_options = request_options.merge(
        :operation => :'QuerySuggestionsClient.get_log_file',
        :header_params => header_params,
        :query_params => query_params,
        :body => post_body,
        :use_read_transporter => false
      )

      @api_client.call_api(:GET, path, new_options)
    end

    # Get logs.
    # Get the logs for a single Query Suggestions index.
    # @param index_name [String] Query Suggestions index name. (required)
    # @param request_options: The request options to send along with the query, they will be merged with the transporter base parameters (headers, query params, timeouts, etc.). (optional)
    # @return [GetLogFile200Response]
    def get_log_file(index_name, request_options = {})
      response = get_log_file_with_http_info(index_name, request_options)
      deserialize(response.body, request_options[:debug_return_type] || 'QuerySuggestions::GetLogFile200Response')
    end

    # Update a configuration.
    # Update a QuerySuggestions configuration.
    # @param index_name [String] Query Suggestions index name. (required)
    # @param query_suggestions_configuration [QuerySuggestionsConfiguration]  (required)
    # @param request_options: The request options to send along with the query, they will be merged with the transporter base parameters (headers, query params, timeouts, etc.). (optional)
    # @return [Http::Response] the response
    def update_config_with_http_info(index_name, query_suggestions_configuration, request_options = {})
      # verify the required parameter 'index_name' is set
      if @api_client.config.client_side_validation && index_name.nil?
        raise ArgumentError, "Missing the required parameter 'index_name' when calling QuerySuggestionsClient.update_config"
      end
      # verify the required parameter 'query_suggestions_configuration' is set
      if @api_client.config.client_side_validation && query_suggestions_configuration.nil?
        raise ArgumentError, "Missing the required parameter 'query_suggestions_configuration' when calling QuerySuggestionsClient.update_config"
      end

      path = '/1/configs/{indexName}'.sub('{' + 'indexName' + '}', @api_client.encode_uri(index_name.to_s))
      query_params = {}
      query_params = query_params.merge(request_options[:query_params]) unless request_options[:query_params].nil?
      header_params = {}
      header_params = header_params.merge(request_options[:header_params]) unless request_options[:header_params].nil?

      post_body = request_options[:debug_body] || @api_client.object_to_http_body(query_suggestions_configuration)

      new_options = request_options.merge(
        :operation => :'QuerySuggestionsClient.update_config',
        :header_params => header_params,
        :query_params => query_params,
        :body => post_body,
        :use_read_transporter => false
      )

      @api_client.call_api(:PUT, path, new_options)
    end

    # Update a configuration.
    # Update a QuerySuggestions configuration.
    # @param index_name [String] Query Suggestions index name. (required)
    # @param query_suggestions_configuration [QuerySuggestionsConfiguration]  (required)
    # @param request_options: The request options to send along with the query, they will be merged with the transporter base parameters (headers, query params, timeouts, etc.). (optional)
    # @return [BaseResponse]
    def update_config(index_name, query_suggestions_configuration, request_options = {})
      response = update_config_with_http_info(index_name, query_suggestions_configuration, request_options)
      deserialize(response.body, request_options[:debug_return_type] || 'QuerySuggestions::BaseResponse')
    end
  end
end
