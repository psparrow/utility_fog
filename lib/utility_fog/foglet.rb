class Foglet
  extend UtilityFog::TagSupport

  attr_reader   :closing_tag
  attr_accessor :tag, :attributes

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
      html = opening_tag_html

      if requires_closing_tag?
        html << content_html
        html << closing_tag_html
      end

      html
  end

  def opening_tag_html
    html = "<#{tag}"

    attributes.each do |key, value|
      html << " #{key}=\"#{value}\""
    end

    html << " /" unless requires_closing_tag?
    html << ">"
  end

  def closing_tag_html
    "</#{tag}>"
  end

  def content_html
    content.join
  end

end
