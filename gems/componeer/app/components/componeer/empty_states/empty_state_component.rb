module Componeer
  module EmptyStates
    class EmptyStateComponent < BaseComponent
      register_as :empty_state

      renders_one :new_resource_action

      def initialize(resource_name:, icon: :exclamation, new_resource_path: nil, description: nil)
        @resource_name = resource_name
        @icon = icon
        @new_resource_path = new_resource_path
        @description = description
      end
    end
  end
end
