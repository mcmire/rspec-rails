require 'spec/runner/configuration'
begin
  require 'test_help'
rescue MissingSourceFile, NameError
  # probably ApplicationController hasn't been loaded yet,
  # but that probably means we're jimmy rigging this
end

if Object.const_defined?(:ActiveRecord) && ActiveRecord.const_defined?(:Base)
  module Spec
    module Runner
      class Configuration
      
        def initialize
          super
          self.fixture_path = RAILS_ROOT + '/spec/fixtures'
        end
 
        def use_transactional_fixtures
          ActiveSupport::TestCase.use_transactional_fixtures
        end
        def use_transactional_fixtures=(value)
          ActiveSupport::TestCase.use_transactional_fixtures = value
        end
 
        def use_instantiated_fixtures
          ActiveSupport::TestCase.use_instantiated_fixtures
        end
        def use_instantiated_fixtures=(value)
          ActiveSupport::TestCase.use_instantiated_fixtures = value
        end
 
        def fixture_path
          ActiveSupport::TestCase.fixture_path
        end
        def fixture_path=(path)
          ActiveSupport::TestCase.fixture_path = path
        end
 
        def global_fixtures
          ActiveSupport::TestCase.fixture_table_names
        end
        def global_fixtures=(fixtures)
          ActiveSupport::TestCase.fixtures(*fixtures)
        end
      end
    end
  end
end