module Componeer
  module Tags
    class TagComponent < BaseComponent
      register_as :tag

      attr_reader :text, :type, :size, :color, :shape, :custom_classes, :options

      DEFAULT_OPTIONS = { type: :default, size: :default, color: :gray, shape: :rounded }.freeze

      def initialize(text = nil, **options)
        @text = text
        @custom_classes = options.delete(:class)
        build_options(options)
      end

      def base_classes
        merge_tailwind_classes([styles.dig(:size, size),
                                styles.dig(:color, color),
                                styles.dig(:shape, shape),
                                custom_classes])
      end
    end
  end
end
