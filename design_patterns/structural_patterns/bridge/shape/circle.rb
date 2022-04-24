# frozen_string_literal: true

require_relative 'shape'

module Shape
  class Circle < Shape
    attr_reader :radius

    def initialize(rendered: nil, radius: 0)
      super rendered: rendered
      @radius = radius
    end

    def draw
      rendered.render_circle radius: radius
    end
  end
end
