module Componeer
  module Cards
    class CardComponent < BaseComponent
      register_as :card

      renders_one :header
      renders_one :body

      attr_reader :mode, :header_text, :body_text, :size, :color, :shape, :custom_classes

      CUSTOM_CLASS_KEYS = %i[header body].freeze
      DEFAULT_OPTIONS = { mode: :primary, header_text: nil, body_text: nil, size: :default,
                          color: :default }.freeze

      def initialize(**options)
        @custom_classes = resolve_custom_classes(options.delete(:class))
        build_options(options)
      end

      def header?
        (header_text || header).present?
      end

      def primary?
        mode == :primary
      end

      def header_styles
        merge_tailwind_classes([common_styles, styles[:header], border_for(:header),
                                shape_for(:header), custom_classes[:header]&.to_s&.split])
      end

      def body_styles
        merge_tailwind_classes([common_styles, styles[:body], border_for(:body), shape_for(:body),
                                custom_classes[:body]&.to_s&.split])
      end

      private

      def common_styles
        [styles.dig(:base, :size, size), styles.dig(:base, :color, mode, color)]
      end

      def border_for(element)
        { header: primary? ? 'border-b' : 'border',
          body: primary? ? '' : "border #{(header? && 'border-t-0').presence}" }.fetch(element)
      end

      def shape_for(element)
        { header: 'rounded-t-lg', body: header? ? 'rounded-b-lg' : 'rounded-lg' }.fetch(element)
      end
    end
  end
end
