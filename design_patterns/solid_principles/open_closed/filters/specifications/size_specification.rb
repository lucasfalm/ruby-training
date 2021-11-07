# frozen_string_literal: true

module Filters::Specifications

  class SizeSpecification

    attr_accessor :criteria

    def initialize criteria: nil
      @criteria = criteria
    end

    def satisfied?(product)
      return false if criteria.nil?

      product.size === criteria
    end
  end
end
