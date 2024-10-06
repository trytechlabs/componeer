module Componeer
  module Helpers
    def componeer
      ComponentRenderer.new(self)
    end
    alias c componeer unless method_defined?(:c)

    class ComponentRenderer
      delegate :render, to: :view_context

      def initialize(view_context)
        @view_context = view_context
      end

      def method_missing(method, *args, **kwargs, &)
        return super unless Componeer.registry.key?(method)

        render(Componeer.registry[method].new(*args, **kwargs)) do |component|
          component.instance_exec(component, &) if block_given?
        end
      end

      def respond_to_missing?(method, include_private = false)
        Componeer.registry.key?(method) || super
      end

      private

      attr_reader :view_context
    end
  end
end
