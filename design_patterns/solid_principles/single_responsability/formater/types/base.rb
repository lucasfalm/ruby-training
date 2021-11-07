



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

    # NOTE: if form_data from base is called then an error is raised
    #       bacause any child of the base must to implement this method
    # 
    def format_data
      raise Formater::Types::MissingContract.new(data), "method format_data not implemented by type"
    end
  end
end

