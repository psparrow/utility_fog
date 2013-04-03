require_relative '../lib/utility_fog'

foglet = Foglet.new(
  tag:         "p",
  closing_tag: true,
)

foglet.set_attribute(:class, "content")

foglet.insert("Hello, World!")

print foglet
