require_relative '../lib/utility_fog'

main = Section.new(attributes: {id: "main"})
div  = Div.new
main.insert(div)

div.insert P.new(content: "Hello, World!")
div.insert P.new(content: "This is a test.")

print main
