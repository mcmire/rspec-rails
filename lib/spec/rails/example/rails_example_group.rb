require 'spec/interop/test'

if Object.const_defined?(:ActionView) && ActionView.const_defined?(:Base) &&
ActionView::Base.respond_to?(:cache_template_extensions)
  ActionView::Base.cache_template_extensions = false
end

module Spec
  module Rails

    module Example
      if ActiveSupport.const_defined?(:TestCase)
        class RailsExampleGroup < ActiveSupport::TestCase
          include ActionController::Assertions::SelectorAssertions
        end
      else
        class RailsExampleGroup < Test::Unit::TestCase
        end
      end
      
      class RailsExampleGroup
        include Spec::Rails::Matchers
        include Spec::Rails::Mocks
        Spec::Example::ExampleGroupFactory.default(self)
      end
      
    end
  end
end
