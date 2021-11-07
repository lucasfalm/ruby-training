# frozen_string_literal: true

module Filters
  class ProductFilter

    attr_accessor :products, :specification

    def initialize products:, specification: nil
      @products = products
      @specification = specification
    end

    def filter
      return [] if specification.nil?

      products.filter do |product|
        specification.satisfied? product
      end
    end
  end
end
