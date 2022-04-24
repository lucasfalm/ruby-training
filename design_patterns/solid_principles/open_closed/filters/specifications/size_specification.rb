# frozen_string_literal: true

require_relative './base'

module Filters
  module Specifications
    class SizeSpecification < Base
      def initialize(criteria: nil)
        super
      end

      def satisfied?(product)
        return false if criteria.nil?

        product.size === criteria
      end
    end
  end
end
