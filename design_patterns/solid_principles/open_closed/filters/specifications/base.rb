# frozen_string_literal: true

module Filters::Specifications

  class Base

    attr_accessor :criteria
  
    def initialize criteria: nil
      set new_criteria: criteria
    end


    def satisfied?(product); end

    def set new_criteria:
      @criteria = new_criteria
    end
  end
end
