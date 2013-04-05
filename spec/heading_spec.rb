require_relative 'spec_helper'

describe Heading do

  specify { Heading.new.requires_closing_tag?.must_equal(true) }

  specify { Heading.new(3).tag.must_equal("h3") }

  specify { Heading.new(1, "Foo", id: "bar").attributes.must_equal({id: "bar"}) }

  specify { "#{Heading.new(1, "Foo")}".must_equal("<h1>Foo</h1>") }

end
