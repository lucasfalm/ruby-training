
# NOTE: the Factory method design pattern is basically about
#       methods inside of a class, that are responsible
#       for creating the wholesale (not piecewise) objects.

class Point

  def initialize x, y
    @x = x
    @y = y
  end

  # NOTE: this method is a factory method, it return
  #       an instance of Point, representing the cartesian point
  # 
  def self.new_cartesian_point x: y:
    self.new x, y
  end

  def self.new_solar_point rho:, theta:
    self.new(
      rho * Math.cos(theta),
      rho * Math.sin(theta)
    )
  end
end

# NOTE: the factory method is inside of the object itself.
# 
cartesian_point = Point.new_cartesian_point x: 50, y: 40
solar_point = Point.new_solar_point rho: 50, theta: 40
