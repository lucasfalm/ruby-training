# frozen_string_literal: true

class Shape
  attr_accessor :rendered

  def initialize(rendered: nil)
    @rendered = rendered
  end

  def set_rendered(rendered:)
    @rendered = rendered
  end
end
