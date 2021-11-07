
module Formater

  class InvalidDataError < StandardError

    attr_accessor :message

    def initialize(data, context)
      @data = data
      @context = context
      @message = format_message
    end

    private

    def format_message
      "Error while formating #{@data.inspect} context #{@context};"
    end
  end

  class Base

    attr_accessor :type, :data
  
    def initialize type:, data:
      @type = type
      @data = data
    end

    protected

    def validate_data! context: {}
      raise Formater::InvalidDataError.new(data, context) unless valid_data?
    end

    def valid_data?
      !data.nil?
    end
  end
end
