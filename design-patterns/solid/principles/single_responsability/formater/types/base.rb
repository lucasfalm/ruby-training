



module Formater::Types

  class MissingContract < StandardError
    attr_reader :object
  
    def initialize(object)
      @object = object
    end
  end

  class Base

    attr_accessor :data

    def initialize data
      @data = data
    end

    def format_data
      raise Formater::Types::MissingContract.new(data), "method format_data not implemented by type"
    end
  end
end

