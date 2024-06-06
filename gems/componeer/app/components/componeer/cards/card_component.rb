module Componeer
  module Cards
    class CardComponent < BaseComponent
      register_as :card

      renders_one :header
      renders_one :body

      attr_reader :header_text, :body_text, :size, :color, :shape

      DEFAULT_OPTIONS = { header_text: nil, body_text: nil, size: :default, color: :default,
                          shape: :rounded }.freeze

      def initialize(**options)
        build_options(options)
      end

      def header_styles
        to_classes_string([common_styles, styles[:header]])
      end

      def body_styles
        to_classes_string([common_styles, styles[:body]])
      end

      private

      def common_styles
        [styles.dig(:base, :size, size), styles.dig(:base, :color, color),
         styles.dig(:base, :shape, shape)]
      end
    end
  end
end
