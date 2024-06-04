module Componeer
  module Tags
    class TagComponent < BaseComponent
      register_as :tag

      attr_reader :text, :type, :size, :color, :shape, :options

      DEFAULT_OPTIONS = { type: :default, size: :default, color: :gray, shape: :rounded }.freeze

      def initialize(text = nil, **options)
        @text = text
        build_options(options)
      end

      def base_classes
        to_classes_string([styles.dig(:size, size),
                           styles.dig(:color, color),
                           styles.dig(:shape, shape)])
      end
    end
  end
end
