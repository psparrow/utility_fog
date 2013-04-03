require_relative 'spec_helper'

describe P do
  specify { P.new.tag.must_equal "p" }
  specify { P.new.requires_closing_tag?.must_equal true }
end
