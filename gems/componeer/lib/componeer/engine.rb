module Componeer
  class Engine < ::Rails::Engine
    isolate_namespace Componeer

    initializer 'componeer.include_componeer_helpers' do |app|
      app.config do |config|
        config.to_prepare do
          Componeer.config do |componeer_config|
            if componeer_config.include_componeer_helpers?
              ActiveSupport.on_load(:action_controller) { include Helpers }
              ActiveSupport.on_load(:action_view) { include Helpers }
            end
          end
        end
      end
    end
  end
end
