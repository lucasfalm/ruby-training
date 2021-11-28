# frozen_string_literal: true

# NOTE: the Brigde design pattern is about connecting two different
#       components (classes) by using abstraction and delegation
# 
#       it prevents something called 'Cartesian product complexity explosion'
#       that means if for one specific class we must to have X other linked classes/componenets
#       then when creating a new class, we need to create X other linked classes
#       1 X 10
#      
#       eg:
#       
#       we have a class Shape
#       and we can have a shape of type circle (Circle < Shape), square, ...
#       and we can draw (render) shapes as pixel (Pixel < Renderer), vector, ...
# 
#       This way, as the number of shape type increases, we will need to create
#       new methods on the rendered classes (render_circle, render_square, ...)
#       instead of having a specific Rendered class for each shape type;
#       RendererSquare (as_vector, as_pixel, ...), RendererCircle, ...
# 
#       aiming to stop depending on implementations
#       and start depending only on abstractions

require_relative "shape/square"
require_relative "shape/circle"
require_relative "shape/rendered/pixel"
require_relative "shape/rendered/vector"

circle = Shape::Circle.new radius: 5
square = Shape::Square.new width: 10

pixel_rendered = Shape::Rendered::Pixel.new
vector_rendered = Shape::Rendered::Vector.new

circle.set_rendered rendered: pixel_rendered
circle.draw

square.set_rendered rendered: vector_rendered
square.draw
