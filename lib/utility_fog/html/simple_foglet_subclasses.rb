def create_foglet_subclass(class_name, tag, closing_tag)
  Object.const_set(class_name, Class.new(Foglet) {
    renders_tag          tag
    requires_closing_tag closing_tag
  })
end

[
  ["Article",    "article", true],
  ["Aside",      "aside",   true],
  ["Break",      "br",      false],
  ["LineBreak",  "br",      false],
  ["Div",        "div",     true],
  ["Header",     "header",  true],
  ["ThemeBreak", "hr",      false],
  ["Footer",     "footer",  true],
  ["Nav",        "nav",     true],
  ["P",          "p",       true],
  ["Paragraph",  "p",       true],
  ["Pre",        "pre",     true],
  ["Section",    "section", true]
].each { |tag| create_foglet_subclass *tag }
