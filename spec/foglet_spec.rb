require_relative 'spec_helper'

describe Foglet do

  it "provides a way to specify the HTML element that it renders" do
    foglet = Foglet.new(tag: "foo")
    foglet.tag.must_equal "foo"
  end

  it "provides a way to specify if the HTML element requires a closing tag" do
    foglet = Foglet.new(closing_tag: true)
    foglet.requires_closing_tag?.must_equal true

    foglet = Foglet.new(closing_tag: false)
    foglet.requires_closing_tag?.must_equal false
  end

  it "has array of content" do
    Foglet.new.content.must_equal []
  end

  it "allows setting content in the constructor" do
    Foglet.new(content: 42).content.must_include 42
    Foglet.new(content: [1, 2, 3]).content.must_equal [1, 2, 3]
  end

  it "accepts attributes in the constructor" do
    foglet = Foglet.new(attributes: {
      id: "my-foglet",
      class: "a-foglet"
    })

    foglet.attributes[:id].must_equal "my-foglet"
    foglet.attributes[:class].must_equal "a-foglet"
  end

  it "keeps a hash of attributes" do
    Foglet.new.attributes.must_equal({})
  end

  it "allows settings the attributes in the constructor" do
    Foglet.new(attributes: {id: "foo"}).attributes[:id].must_equal "foo"
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
        attributes:  {id: "bar", class: "testing"}
      )

      "#{foglet}".must_equal("<foo id=\"bar\" class=\"testing\" />")
    end
  end

  describe "configuring subclasses" do

    class FooTag < Foglet
      renders_tag "foo"
      requires_closing_tag false
    end

    specify { FooTag.new.tag.must_equal "foo" }
    specify { FooTag.new.requires_closing_tag?.must_equal false }
  end

end
