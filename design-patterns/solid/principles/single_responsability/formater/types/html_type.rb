require_relative "./base"

module Formater::Types

  class HtmlType < Formater::Types::Base

    def initialize data
      super
    end

    def format_data
      puts "formating data #{data.inspect} as HTML"
    end
  end
end
