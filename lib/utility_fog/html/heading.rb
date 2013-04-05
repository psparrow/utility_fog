class Heading < Foglet

  def initialize(level = 1, content = "", attributes = {})
    self.tag        = "h#{level}"
    self.content    << content
    self.attributes = attributes
  end

end
