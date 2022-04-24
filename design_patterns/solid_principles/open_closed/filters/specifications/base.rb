# frozen_string_literal: true

module Filters
  module Specifications
    class Base
      attr_accessor :criteria

      def initialize(criteria: nil)
        set criteria: criteria
      end

      def satisfied?(product); end

      def set(criteria:)
        @criteria = criteria
      end
    end
  end
end
