# NOTE: isn't a best practice have more than 10 parameters to initialize an
#       object, instead we can create it in a piecewise way, with creational patterns.
#       
#       BUILDER PATTERN
#       "when piecewise object construction is complicated, provide an
#        API for doing it succinctly"

require_relative "./tag"

html_builder = Tag.create name: "html"
html_builder.
  add_child(name: "header")

html_builder.
  add_child(name: "body").
  add_child_to(parent_name: "body", name: "p", text: "Hello").
  add_child_to(parent_name: "body", name: "p", text: "World").
  add_child_to(parent_name: "header", name: "title", text: "Using builder pattern!").
  add_child_to(parent_name: "body", name: "div").
  add_child_to(parent_name: "div", name: "p", text: "it can go really deep")

puts html_builder.build.format_string
# <html>
#   <header>
#     <title>Using builder pattern!</title>
#   </header>
#   <body>
#     <p>Hello</p>
#     <p>World</p>
#     <div>
#       <p>it can go really deep</p>
#     </div>
#   </body>
# </html>

puts html_builder.inspect
