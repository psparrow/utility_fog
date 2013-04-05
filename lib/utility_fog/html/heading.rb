class Heading < Foglet

  def initialize(level = 1, content = "", attributes = {})
    super(tag: "h#{level}", attributes: attributes, content: content)
  end

end
