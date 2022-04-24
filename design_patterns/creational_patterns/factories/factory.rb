# frozen_string_literal: true

# NOTE: the Factory design pattern is basically a separated class
#       that is responsible solely for the wholesale (not piecewise)
#       creation of objects.

class Point
  def initialize(x, y)
    @x = x
    @y = y
  end

  # NOTE: exposing the factory
  #
  def self.factory
    PointFactory
  end
end

class PointFactory
  def self.new_cartesian_point(x:, y:)
    Point.new x, y
  end

  def self.new_solar_point(rho:, theta:)
    Point.new(
      rho * Math.cos(theta),
      rho * Math.sin(theta)
    )
  end
end

# NOTE: we use the factory class to create the object
#       but it's pretty much the Factory design pattern, but following
#       the separation of concerns.
#
cartesian_point = Point.factory.new_cartesian_point x: 50, y: 40
solar_point = Point.factory.new_solar_point rho: 50, theta: 40

puts cartesian_point.inspect
