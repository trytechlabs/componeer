module Componeer
  module Buttons
    class ButtonComponent < BaseComponent
      register_as :button

      attr_reader :text, :options, :custom_classes

      def initialize(content_or_options = nil, options = {})
        @text, @options = resolve_params(content_or_options, options)
      end

      def base_classes
        [styles[:base],
         styles.dig(:size, size),
         styles.dig(:color, mode, color),
         styles.dig(:shape, shape)]
      end

      def color = @color ||= @options.delete(:color) || :brand
      def mode = @mode ||= @options.delete(:primary) ? :primary : :outlined
      def size = @size ||= @options.delete(:size) || :medium
      def shape = @shape ||= @options.delete(:shape) || :rounded
    end
  end
end
