require 'spec'

require 'spec/rails/extensions/spec/runner/configuration'
require 'spec/rails/extensions/spec/matchers/have'

if Object.const_defined?(:ActiveRecord) && ActiveRecord.const_defined?(:Base)
  require 'spec/rails/extensions/active_record/base'
end
if Object.const_defined?(:ActionController) && ActionController.const_defined?(:Base)
  require 'spec/rails/extensions/action_controller/rescue'
  require 'spec/rails/extensions/action_controller/test_case'
  require 'spec/rails/extensions/action_controller/test_response'
  require 'spec/rails/extensions/action_view/base'
end