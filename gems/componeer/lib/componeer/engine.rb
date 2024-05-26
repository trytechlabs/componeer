module Componeer
  class Engine < ::Rails::Engine
    isolate_namespace Componeer

    initializer 'componeer.setup_helpers' do |app|
      app.config do |config|
        config.to_prepare do
          ActiveSupport.on_load(:action_controller) { include Helpers }
          ActiveSupport.on_load(:action_view) { include Helpers }
        end
      end
    end
  end
end
