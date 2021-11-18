# frozen_string_literal: true

require_relative "./base"

module Filters::Specifications

  class OrSpecification < Base

    def initialize criteria: []
      super
    end

    def satisfied?(product)
      return false if criteria.empty?

      criteria.any? do |specification|
        specification.satisfied? product
      end
    end
  end
end
