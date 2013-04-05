require_relative 'spec_helper'

describe List do

  it "accepts a list type and attribute hash" do
    list = List.new("ul", id: "foo")

    list.tag.must_equal("ul")
    list.attributes[:id].must_equal("foo")
  end

  it "wraps each item in li tags" do
    list = List.new
    list.insert "Item 1"
    list.insert "Item 2"
    "#{list}".must_equal("<ul><li>Item 1</li><li>Item 2</li></ul>")
  end

end
