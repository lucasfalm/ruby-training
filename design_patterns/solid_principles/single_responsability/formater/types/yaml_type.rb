# frozen_string_literal: true

require_relative './base'

module Formater
  module Types
    class YamlType < Formater::Types::Base
      def format_data
        puts "formating data #{data.inspect} as YAML"
      end
    end
  end
end
