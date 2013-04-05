require_relative '../lib/utility_fog'

foglet = Foglet.new(
  tag:         "p",
  closing_tag: true,
)

foglet.attributes[:class] = "content"
foglet.attributes[:id]    = "main"

foglet.insert("Hello, World!")

print foglet
