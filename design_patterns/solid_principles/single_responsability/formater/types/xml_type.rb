# frozen_string_literal: true

require_relative './base'

module Formater
  module Types
    class XmlType < Formater::Types::Base
      def format_data
        puts "formating data #{data.inspect} as XML"
      end
    end
  end
end
