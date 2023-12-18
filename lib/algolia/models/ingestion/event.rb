# Code generated by OpenAPI Generator (https://openapi-generator.tech), manual changes will be lost - read more on https://github.com/algolia/api-clients-automation. DO NOT EDIT.

require 'date'
require 'time'

module Algolia
  module Ingestion
    # An event describe a step of the task execution flow..
    class Event
      # The event UUID.
      attr_accessor :event_id

      # The run UUID.
      attr_accessor :run_id

      # The parent event, the cause of this event.
      attr_accessor :parent_id

      attr_accessor :status

      attr_accessor :type

      # The extracted record batch size.
      attr_accessor :batch_size

      attr_accessor :data

      # Date of publish (RFC3339 format).
      attr_accessor :published_at

      class EnumAttributeValidator
        attr_reader :datatype
        attr_reader :allowable_values

        def initialize(datatype, allowable_values)
          @allowable_values = allowable_values.map do |value|
            case datatype.to_s
            when /Integer/i
              value.to_i
            when /Float/i
              value.to_f
            else
              value
            end
          end
        end

        def valid?(value)
          !value || allowable_values.include?(value)
        end
      end

      # Attribute mapping from ruby-style variable name to JSON key.
      def self.attribute_map
        {
          :'event_id' => :'eventID',
          :'run_id' => :'runID',
          :'parent_id' => :'parentID',
          :'status' => :'status',
          :'type' => :'type',
          :'batch_size' => :'batchSize',
          :'data' => :'data',
          :'published_at' => :'publishedAt'
        }
      end

      # Returns all the JSON keys this model knows about
      def self.acceptable_attributes
        attribute_map.values
      end

      # Attribute type mapping.
      def self.types_mapping
        {
          :'event_id' => :'String',
          :'run_id' => :'String',
          :'parent_id' => :'String',
          :'status' => :'EventStatus',
          :'type' => :'EventType',
          :'batch_size' => :'Integer',
          :'data' => :'Hash<String, Object>',
          :'published_at' => :'String'
        }
      end

      # List of attributes with nullable: true
      def self.openapi_nullable
        Set.new([
        ])
      end

      # Initializes the object
      # @param [Hash] attributes Model attributes in the form of hash
      def initialize(attributes = {})
        if (!attributes.is_a?(Hash))
          fail ArgumentError, "The input argument (attributes) must be a hash in `Algolia::Event` initialize method"
        end

        # check to see if the attribute exists and convert string to symbol for hash key
        attributes = attributes.each_with_object({}) { |(k, v), h|
          if (!self.class.attribute_map.key?(k.to_sym))
            fail ArgumentError, "`#{k}` is not a valid attribute in `Algolia::Event`. Please check the name to make sure it's valid. List of attributes: " + self.class.attribute_map.keys.inspect
          end
          h[k.to_sym] = v
        }

        if attributes.key?(:'event_id')
          self.event_id = attributes[:'event_id']
        else
          self.event_id = nil
        end

        if attributes.key?(:'run_id')
          self.run_id = attributes[:'run_id']
        else
          self.run_id = nil
        end

        if attributes.key?(:'parent_id')
          self.parent_id = attributes[:'parent_id']
        end

        if attributes.key?(:'status')
          self.status = attributes[:'status']
        else
          self.status = nil
        end

        if attributes.key?(:'type')
          self.type = attributes[:'type']
        else
          self.type = nil
        end

        if attributes.key?(:'batch_size')
          self.batch_size = attributes[:'batch_size']
        else
          self.batch_size = nil
        end

        if attributes.key?(:'data')
          if (value = attributes[:'data']).is_a?(Hash)
            self.data = value
          end
        end

        if attributes.key?(:'published_at')
          self.published_at = attributes[:'published_at']
        else
          self.published_at = nil
        end
      end

      # Custom attribute writer method with validation
      # @param [Object] batch_size Value to be assigned
      def batch_size=(batch_size)
        if batch_size.nil?
          fail ArgumentError, 'batch_size cannot be nil'
        end

        if batch_size < 0
          fail ArgumentError, 'invalid value for "batch_size", must be greater than or equal to 0.'
        end

        @batch_size = batch_size
      end

      # Checks equality by comparing each attribute.
      # @param [Object] Object to be compared
      def ==(o)
        return true if self.equal?(o)
        self.class == o.class &&
            event_id == o.event_id &&
            run_id == o.run_id &&
            parent_id == o.parent_id &&
            status == o.status &&
            type == o.type &&
            batch_size == o.batch_size &&
            data == o.data &&
            published_at == o.published_at
      end

      # @see the `==` method
      # @param [Object] Object to be compared
      def eql?(o)
        self == o
      end

      # Calculates hash code according to all attributes.
      # @return [Integer] Hash code
      def hash
        [event_id, run_id, parent_id, status, type, batch_size, data, published_at].hash
      end

      # Builds the object from hash
      # @param [Hash] attributes Model attributes in the form of hash
      # @return [Object] Returns the model itself
      def self.build_from_hash(attributes)
        return nil unless attributes.is_a?(Hash)
        attributes = attributes.transform_keys(&:to_sym)
        transformed_hash = {}
        types_mapping.each_pair do |key, type|
          if attributes.key?(attribute_map[key]) && attributes[attribute_map[key]].nil?
            transformed_hash["#{key}"] = nil
          elsif type =~ /\AArray<(.*)>/i
            # check to ensure the input is an array given that the attribute
            # is documented as an array but the input is not
            if attributes[attribute_map[key]].is_a?(Array)
              transformed_hash["#{key}"] = attributes[attribute_map[key]].map { |v| _deserialize($1, v) }
            end
          elsif !attributes[attribute_map[key]].nil?
            transformed_hash["#{key}"] = _deserialize(type, attributes[attribute_map[key]])
          end
        end
        new(transformed_hash)
      end

      # Deserializes the data based on type
      # @param string type Data type
      # @param string value Value to be deserialized
      # @return [Object] Deserialized data
      def self._deserialize(type, value)
        case type.to_sym
        when :Time
          Time.parse(value)
        when :Date
          Date.parse(value)
        when :String
          value.to_s
        when :Integer
          value.to_i
        when :Float
          value.to_f
        when :Boolean
          if value.to_s =~ /\A(true|t|yes|y|1)\z/i
            true
          else
            false
          end
        when :Object
          # generic object (usually a Hash), return directly
          value
        when /\AArray<(?<inner_type>.+)>\z/
          inner_type = Regexp.last_match[:inner_type]
          value.map { |v| _deserialize(inner_type, v) }
        when /\AHash<(?<k_type>.+?), (?<v_type>.+)>\z/
          k_type = Regexp.last_match[:k_type]
          v_type = Regexp.last_match[:v_type]
          {}.tap do |hash|
            value.each do |k, v|
              hash[_deserialize(k_type, k)] = _deserialize(v_type, v)
            end
          end
        else # model
          # models (e.g. Pet) or oneOf
          klass = Algolia::Ingestion.const_get(type)
          klass.respond_to?(:openapi_any_of) || klass.respond_to?(:openapi_one_of) ? klass.build(value) : klass.build_from_hash(value)
        end
      end

      # Returns the string representation of the object
      # @return [String] String presentation of the object
      def to_s
        to_hash.to_s
      end

      # to_body is an alias to to_hash (backward compatibility)
      # @return [Hash] Returns the object in the form of hash
      def to_body
        to_hash
      end

      # Returns the object in the form of hash
      # @return [Hash] Returns the object in the form of hash
      def to_hash
        hash = {}
        self.class.attribute_map.each_pair do |attr, param|
          value = self.send(attr)
          if value.nil?
            is_nullable = self.class.openapi_nullable.include?(attr)
            next if !is_nullable || (is_nullable && !instance_variable_defined?(:"@#{attr}"))
          end

          hash[param] = _to_hash(value)
        end
        hash
      end

      # Outputs non-array value in the form of hash
      # For object, use to_hash. Otherwise, just return the value
      # @param [Object] value Any valid value
      # @return [Hash] Returns the value in the form of hash
      def _to_hash(value)
        if value.is_a?(Array)
          value.compact.map { |v| _to_hash(v) }
        elsif value.is_a?(Hash)
          {}.tap do |hash|
            value.each { |k, v| hash[k] = _to_hash(v) }
          end
        elsif value.respond_to? :to_hash
          value.to_hash
        else
          value
        end
      end
    end
  end
end