module Componeer
  module Tags
    class TagComponent < BaseComponent
      register_as :tag

      attr_reader :text, :type, :size, :color, :shape, :options

      def initialize(text = nil, **options)
        @text = text
        @type = options.delete(:type) || :default
        @size = options.delete(:size) || :default
        @color = options.delete(:color) || :gray
        @shape = options.delete(:shape) || :rounded
        @options = options
      end

      def base_classes
        to_classes_string([styles.dig(:size, size),
                           styles.dig(:color, color),
                           styles.dig(:shape, shape)])
      end
    end
  end
end
