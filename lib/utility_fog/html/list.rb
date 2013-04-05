class List < Foglet

  def initialize(type = "ul", attributes = {})
    super(tag: type, attributes: attributes)
  end

  def render_item(item)
    "<li>#{item}</li>"
  end

end
