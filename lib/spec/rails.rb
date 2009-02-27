silence_warnings { RAILS_ENV = "test" }

begin
  require_dependency 'application_controller'
rescue MissingSourceFile
  begin
    require_dependency 'application'
  rescue MissingSourceFile, NameError
    # ok, ActionController is not defined
  end
end

if Object.const_defined?(:ActionController) && ActionController.const_defined?(:Base)
  require 'action_controller/test_process'
  require 'action_controller/integration'
end
if Object.const_defined?(:ActiveRecord) && ActiveRecord.const_defined?(:Base)
  require 'active_record/fixtures'
end
require 'test/unit'

require 'spec'

require 'spec/rails/matchers'
require 'spec/rails/mocks'
require 'spec/rails/example'
require 'spec/rails/extensions'
require 'spec/rails/interop/testcase'

if Object.const_defined?(:ActionMailer) && Rails::VERSION::STRING >= "2.0"
  # This is a temporary hack to get rspec's auto-runner functionality to not consider
  # ActionMailer::TestCase to be a spec waiting to run.
  require 'action_mailer/test_case'
  Spec::Example::ExampleGroupFactory.register(:ignore_for_now, ActionMailer::TestCase)
end