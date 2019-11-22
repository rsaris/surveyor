module Surveyor
  module MustacheContext
    extend ActiveSupport::Concern
    
    def in_context(text, context=nil)
      case context
      when NilClass
        text
      when Hash
        Mustache.render(text, context)
      else
        context.render(text)
      end
    end
  end
end
