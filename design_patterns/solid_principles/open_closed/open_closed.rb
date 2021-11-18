# NOTE: open for extention, closed for modification
#       once in production, you don't change anymore
#       avoiding space explosion (class with infinity lines and methods)
# 
#       using Speficiation Pattern as example
#       each new filter is a new specification
# 
#       we have a class product, and we will need to filter
#       products by specifications;
# 
#       so instead of creating each filter inside of a ProductFilter class,
#       or even the Product class
#       we we'll create specifications.
# 
#       we have a class called ProductFilter
#       it receives the Specification and the products to be filtered
#         
#       product_filter.specification = your specification (color, size, price, likes, etc)
#       product_filter.filter
# 
#       another clear example of open closed principle is the Strategy pattern
# 
require_relative "./product"
require_relative "./product_color"
require_relative "./product_size"
require_relative "./filters/product_filter"
require_relative "./filters/specifications/color_specification"
require_relative "./filters/specifications/size_specification"
require_relative "./filters/specifications/and_specification"
require_relative "./filters/specifications/or_specification"

# NOTE: creating colors
# 
green_color = ProductColor.new name: ProductColor::NAMES[:green]
blue_color = ProductColor.new name: ProductColor::NAMES[:blue]
red_color = ProductColor.new name: ProductColor::NAMES[:red]
white_color = ProductColor.new name: ProductColor::NAMES[:white]
black_color = ProductColor.new name: ProductColor::NAMES[:black]

# NOTE: creating sizes
# 
small_size = ProductSize.new name: ProductSize::NAMES[:small]
medium_size  = ProductSize.new name: ProductSize::NAMES[:medium]
large_size  = ProductSize.new name: ProductSize::NAMES[:large]

# NOTE: creating products, with color and size
# 
car = Product.new(
  name: "Car",
  color: green_color,
  size: large_size
)

house = Product.new(
  name: "House",
  color: blue_color,
  size: large_size
)

book = Product.new(
  name: "Book",
  color: white_color,
  size: small_size
)

notebook = Product.new(
  name: "Notebook",
  color: black_color,
  size: small_size
)

# NOTE: creating the product filter, that will deal with the specification
# 
product_filter = Filters::ProductFilter.new products: [car, house, book, notebook]

# NOTE: creating specifications
# 
color_specification = Filters::Specifications::ColorSpecification.new
size_specification = Filters::Specifications::SizeSpecification.new
and_specification = Filters::Specifications::AndSpecification.new
or_specification = Filters::Specifications::OrSpecification.new

# NOTE: setting the 'criteria' for each specification. 
# 
#       it means, what I'm looking for
#       black things? medium size things? both? -> criterias
# 
size_specification.set new_criteria: medium_size
color_specification.set new_criteria: black_color

and_specification.set new_criteria: [color_specification, size_specification]
or_specification.set new_criteria: [color_specification, size_specification]

# NOTE: defining the filter that will be applied to the query
# 
product_filter.set new_specification: or_specification

# NOTE: using the filter
# 
puts "filter result: #{product_filter.filter}"
# filter result:
# [#<Product:0x000056025053be68 @name="Notebook", @color=#<ProductColor:0x00005602505408a0 @name="black">, @size=#<ProductSize:0x00005602505406e8 @name="small">>]
