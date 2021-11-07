# frozen_string_literal: true

class ProductColor

  attr_accessor :name

  def initialize name:
    @name = name
  end

  NAMES = {
    red: "red",
    green: "green",
    blue: "blue",
    white: "white",
    black: "black",
  }.freeze
end
