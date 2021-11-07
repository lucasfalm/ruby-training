# frozen_string_literal: true

class Product

  attr_accessor :name, :color, :size

  def initialize name:, color:, size:
    @name = name
    @color = color
    @size = size
  end
end
