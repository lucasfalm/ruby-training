# frozen_string_literal: true

module Filters::Specifications

  class OrSpecification

    attr_accessor :criteria

    def initialize criteria: []
      @criteria = criteria
    end

    def satisfied?(product)
      return false if criteria.empty?

      criteria.any? do |specification|
        specification.satisfied? product
      end
    end
  end
end
