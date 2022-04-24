# frozen_string_literal: true

module Filters
  class ProductFilter
    attr_accessor :products, :specification

    def initialize(products:, specification: nil)
      @products = products
      set specification: specification
    end

    def filter
      return [] if specification.nil?

      # NOTE: this class will never change, independently of
      #       how many specifications are defined, they just need to
      #       satisfy the contract/specification, that is implement
      #       the 'satisfied?' instance method.
      #
      #       a perfect example of Open Closed principle
      #
      products.filter do |product|
        specification.satisfied? product
      end
    end

    def set(specification:)
      @specification = specification
    end
  end
end
