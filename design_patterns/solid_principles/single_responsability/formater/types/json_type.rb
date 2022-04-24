# frozen_string_literal: true

require_relative './base'

module Formater
  module Types
    class JsonType < Formater::Types::Base
      def format_data
        puts "formating data #{data.inspect} as JSON"
      end
    end
  end
end
