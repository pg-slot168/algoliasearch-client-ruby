# Code generated by OpenAPI Generator (https://openapi-generator.tech), manual changes will be lost - read more on https://github.com/algolia/api-clients-automation. DO NOT EDIT.

require 'date'
require 'time'

module Algolia
  module Search
    class Acl
      ADD_OBJECT = "addObject".freeze
      ANALYTICS = "analytics".freeze
      BROWSE = "browse".freeze
      DELETE_OBJECT = "deleteObject".freeze
      DELETE_INDEX = "deleteIndex".freeze
      EDIT_SETTINGS = "editSettings".freeze
      INFERENCE = "inference".freeze
      LIST_INDEXES = "listIndexes".freeze
      LOGS = "logs".freeze
      PERSONALIZATION = "personalization".freeze
      RECOMMENDATION = "recommendation".freeze
      SEARCH = "search".freeze
      SEE_UNRETRIEVABLE_ATTRIBUTES = "seeUnretrievableAttributes".freeze
      SETTINGS = "settings".freeze
      USAGE = "usage".freeze

      def self.all_vars
        @all_vars ||= [ADD_OBJECT, ANALYTICS, BROWSE, DELETE_OBJECT, DELETE_INDEX, EDIT_SETTINGS, INFERENCE, LIST_INDEXES, LOGS, PERSONALIZATION, RECOMMENDATION, SEARCH, SEE_UNRETRIEVABLE_ATTRIBUTES, SETTINGS, USAGE].freeze
      end

      # Builds the enum from string
      # @param [String] The enum value in the form of the string
      # @return [String] The enum value
      def self.build_from_hash(value)
        new.build_from_hash(value)
      end

      # Builds the enum from string
      # @param [String] The enum value in the form of the string
      # @return [String] The enum value
      def build_from_hash(value)
        return value if Acl.all_vars.include?(value)
        raise "Invalid ENUM value #{value} for class #Acl"
      end
    end
  end
end