require 'view_component/test_helpers'
require 'view_component/system_test_helpers'
require 'capybara/rspec'

module ViewComponent
  module TestHelpers
    def render_inline(component, **args, &)
      @page = nil

      vc_test_controller.view_context.render(component, args, &)
    end
  end
end

RSpec.configure do |config|
  config.include ViewComponent::TestHelpers, type: :component
  config.include ViewComponent::SystemTestHelpers, type: :component
  config.include Capybara::RSpecMatchers, type: :component
end
