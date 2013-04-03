module UtilityFog
  module TagSupport
    define_method :renders_tag do |tag_name|
      self.class_eval("def tag;\"#{tag_name}\";end")
    end

    define_method :requires_closing_tag do |closing|
      self.class_eval("def closing_tag;#{closing};end")
    end
  end
end

class Class
  include UtilityFog::TagSupport
end
