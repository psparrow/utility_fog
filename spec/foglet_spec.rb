require_relative 'spec_helper'

describe Foglet do

  it "provides a way to specify the HTML element that it renders" do
    foglet = Foglet.new(tag: "foo")

    foglet.tag.must_equal "foo"
  end

  it "provides a way to specify if the HTML element requires a closing tag" do
    foglet = Foglet.new
    foglet.requires_closing_tag?.must_equal true

    foglet = Foglet.new(closing_tag: false)
    foglet.requires_closing_tag?.must_equal false
  end

  it "has array of content" do
    foglet = Foglet.new(tag: "foo", closing_tag: true)
    foglet.insert 42

    foglet.content.must_equal [42]
  end

  it "accepts attributes in the constructor" do
    foglet = Foglet.new(attributes: {
      id: "my-foglet",
      class: "a-foglet"
    })

    foglet.attribute(:id).must_equal "my-foglet"
    foglet.attribute(:class).must_equal "a-foglet"
  end

  it "supports setting single attribute values" do
    foglet = Foglet.new
    foglet.set_attribute(:id, "foo")

    foglet.attribute(:id).must_equal "foo"
 end

  describe "rendering the HTML output" do
    it "renders the content between the opening and closing tag" do
      foglet = Foglet.new(tag: "foo", closing_tag: true)
      foglet.insert("Hello, World!")

      "#{foglet}".must_equal("<foo>Hello, World!</foo>")
    end

    it "renders the attributes when printing" do
      foglet = Foglet.new(
        tag:         "foo",
        closing_tag: false,
        attributes:  {id: "bar"}
      )

      "#{foglet}".must_equal("<foo id=\"bar\" />")
    end
  end

  describe "subclass #renders_tag and #requires_closing_tag" do

    class FooTag < Foglet
      renders_tag "foo"
      requires_closing_tag false
    end

    it "uses the tag and closing_tag settings from configure_tag" do
      foo = FooTag.new
      foo.tag.must_equal("foo")
      foo.requires_closing_tag?.must_equal(false)
    end
  end

end
