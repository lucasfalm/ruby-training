# frozen_string_literal: true

require './formater/base'

module Formater
  class Manager < Formater::Base
    def format_data
      validate_data! context: { type: type }

      type.new(data).format_data
    end
  end
end
