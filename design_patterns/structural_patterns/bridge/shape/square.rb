# frozen_string_literal: true

require_relative 'shape'

module Shape
  class Square < Shape
    attr_reader :width

    def initialize(rendered: nil, width: 0)
      super rendered: rendered
      @width = width
    end

    def draw
      rendered.render_square width: width
    end
  end
end
