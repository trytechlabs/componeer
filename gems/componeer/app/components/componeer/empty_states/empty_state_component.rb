module Componeer
  module EmptyStates
    class EmptyStateComponent < BaseComponent
      register_as :empty_state

      renders_one :new_resource_action

      DEFAULT_OPTIONS = { icon: :exclamation, new_resource_path: nil, description: nil }.freeze

      def initialize(resource_name:, **options)
        @resource_name = resource_name
        build_options(options)
      end
    end
  end
end
