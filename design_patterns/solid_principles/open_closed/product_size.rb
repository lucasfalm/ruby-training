# frozen_string_literal: true

class ProductSize
  attr_accessor :name

  def initialize(name:)
    @name = name
  end

  NAMES = {
    small: 'small',
    medium: 'medium',
    large: 'large'
  }.freeze
end
