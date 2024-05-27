Componeer.config do |componeer_config|
  if componeer_config.include_componeer_helpers?
    ActiveSupport.on_load(:action_controller) { include Componeer::Helpers }
    ActiveSupport.on_load(:action_view) { include Componeer::Helpers }
  end
end

Componeer.eager_load!
