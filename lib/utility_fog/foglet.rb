class Foglet

  attr_reader :tag, :closing_tag, :attributes

  def initialize(args = {})
    @tag         = args[:tag] unless tag
    @closing_tag = args.fetch(:closing_tag, true) if closing_tag == nil
    @attributes  = args.fetch(:attributes, {})
  end

  def requires_closing_tag?
    closing_tag
  end

  def content
    @content ||= []
  end

  def insert(item)
    content << item
  end

  def attribute(key)
    attributes[key]
  end

  def set_attribute(key, value)
    attributes[key] = value
  end

  def to_s
    if tag
      html = "<#{tag}"

      attributes.each do |key, value|
        html << " #{key}=\"#{value}\""
      end

      if requires_closing_tag?
        html << ">"
        html << content.join
        html << "</#{tag}>"
      else
        html << " />"
      end
    else
      html = content.join
    end

    html
  end

end
