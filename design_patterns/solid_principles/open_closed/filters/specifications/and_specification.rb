# frozen_string_literal: true

require_relative "./base"

module Filters::Specifications

  class AndSpecification < Base

    def initialize criteria: []
      super
    end

    def satisfied?(product)
      return false if criteria.empty?

      criteria.all? do |specification|
        specification.satisfied? product
      end
    end
  end
end
