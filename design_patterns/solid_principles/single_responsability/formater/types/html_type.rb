# frozen_string_literal: true

require_relative './base'

module Formater
  module Types
    class HtmlType < Formater::Types::Base
      def format_data
        puts "formating data #{data.inspect} as HTML"
      end
    end
  end
end
