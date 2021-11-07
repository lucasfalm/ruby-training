# frozen_string_literal: true

module Filters::Specifications

  class AndSpecification

    attr_accessor :criteria

    def initialize criteria: []
      @criteria = criteria
    end

    def satisfied?(product)
      return false if criteria.empty?

      criteria.all? do |specification|
        specification.satisfied? product
      end
    end
  end
end
