require_relative "./base"

module Formater::Types

  class XmlType < Formater::Types::Base

    def initialize data
      super
    end

    def format_data
      puts "formating data #{data.inspect} as XML"
    end
  end
end
