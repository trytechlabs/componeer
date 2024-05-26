module Componeer
  module Buttons
    class ButtonComponent < BaseComponent
      attr_reader :text

      def initialize(content_or_options = nil, options = {})
        @text, @options = resolve_params(content_or_options, options)
      end

      def options
        @options.reverse_merge(type: :button, class: classes)
      end

      private

      def classes
        'underline border rounded-md p-2 text-red-400'
      end

      def base_class
        'componeer-button'
      end

      def state_classes
        [[@options[:mode], @options[:mode].present?]]
      end
    end
  end
end
