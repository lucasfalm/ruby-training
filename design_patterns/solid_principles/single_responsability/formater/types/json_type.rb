require_relative "./base"

module Formater::Types

  class JsonType < Formater::Types::Base

    def initialize data
      super
    end

    def format_data
      puts "formating data #{data.inspect} as JSON"
    end
  end
end
