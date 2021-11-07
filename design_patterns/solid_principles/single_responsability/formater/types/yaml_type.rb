require_relative "./base"

module Formater::Types

  class YamlType < Formater::Types::Base

    def initialize data
      super
    end

    def format_data
      puts "formating data #{data.inspect} as YAML"
    end
  end
end
