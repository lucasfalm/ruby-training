# frozen_string_literal: true

require_relative './base'

module Filters
  module Specifications
    class ColorSpecification < Base
      def initialize(criteria: nil)
        super
      end

      def satisfied?(product)
        return false if criteria.nil?

        product.color === criteria
      end
    end
  end
end
