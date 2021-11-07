# frozen_string_literal: true

module Filters::Specifications

  class ColorSpecification

    attr_accessor :criteria

    def initialize criteria: nil
      @criteria = criteria
    end

    def satisfied?(product)
      return false if criteria.nil?

      product.color === criteria
    end
  end
end
