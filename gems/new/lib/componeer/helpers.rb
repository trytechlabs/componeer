module Componeer
  module Helpers
    def componeer
      @componeer ||= Helper.new(self)
    end

    class Helper
      delegate :render, to: :view_context

      def initialize(view_context)
        @view_context = view_context
      end

      def method_missing(method, *args, **kwargs, &)
        if Componeer.registry.key?(method)
          render(Componeer.registry[method].new(*args, **kwargs), &)
        else
          super
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
