# open for extention, closed for modification
# once in production, you don't change anymore
# avoiding space explosion (class with infinity lines and methods)

# using Speficiation Pattern as example
# each new funcionality is a new specification

# we have a class product, and we will need to filter products by specifications
# so instead of creating each filter inside of a ProductFilter class,
# or even the Product class
# we we'll create specifications

require_relative "./product"
require_relative "./product_color"
require_relative "./product_size"
require_relative "./filters/product_filter"
require_relative "./filters/specifications/color_specification"
require_relative "./filters/specifications/size_specification"
require_relative "./filters/specifications/and_specification"
require_relative "./filters/specifications/or_specification"

# colors:
green_color = ProductColor.new name: ProductColor::NAMES[:green]
blue_color = ProductColor.new name: ProductColor::NAMES[:blue]
red_color = ProductColor.new name: ProductColor::NAMES[:red]
white_color = ProductColor.new name: ProductColor::NAMES[:white]
black_color = ProductColor.new name: ProductColor::NAMES[:black]

# sizes:
small_size = ProductSize.new name: ProductSize::NAMES[:small]
medium_size  = ProductSize.new name: ProductSize::NAMES[:medium]
large_size  = ProductSize.new name: ProductSize::NAMES[:large]

# products:
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

# filter:
product_filter = Filters::ProductFilter.new products: [car, house, book, notebook]

# specifications:
color_specification = Filters::Specifications::ColorSpecification.new
size_specification = Filters::Specifications::SizeSpecification.new
and_specification = Filters::Specifications::AndSpecification.new
or_specification = Filters::Specifications::OrSpecification.new

size_specification.criteria = medium_size
color_specification.criteria = black_color

and_specification.criteria = [color_specification, size_specification]
or_specification.criteria = [color_specification, size_specification]

# filtering by:
product_filter.specification = or_specification

puts "filter result: #{product_filter.filter}"