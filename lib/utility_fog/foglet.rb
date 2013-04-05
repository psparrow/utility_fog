class Foglet
  extend UtilityFog::TagSupport

  attr_accessor :tag, :closing_tag, :attributes

  def initialize(args = {})
    @tag         = args[:tag] unless tag
    @closing_tag = args.fetch(:closing_tag, true) if closing_tag == nil
    @attributes  = args.fetch(:attributes, {})
    @content     = Array(args.fetch(:content, []))
  end

  def content
    @content ||= []
  end

  def attributes
    @attributes ||= {}
  end

  def requires_closing_tag?
    (closing_tag == nil) ||  closing_tag
  end

  def insert(item)
    content << item
  end

  def to_s
      html = render_opening_tag

      if requires_closing_tag?
        html << render_content
        html << render_closing_tag
      end

      html
  end

  def render_opening_tag
    html = "<#{tag}"

    html << render_attributes
    html << " /" unless requires_closing_tag?
    html << ">"
  end

  def render_attributes
    attributes.keys.inject("") { |html, key|
      html << " #{key}=\"#{attributes[key]}\""
    }
  end

  def render_closing_tag
    "</#{tag}>"
  end

  def render_content
    content.inject("") { |html, item|
      html << render_item(item)
    }
  end

  def render_item(item)
    "#{item}"
  end

end
