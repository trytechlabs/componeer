module Componeer
  module Tables
    class ColumnComponent < BaseComponent
      attr_reader :table, :title, :custom_classes, :align, :options
      delegate :density, to: :table

      CUSTOM_CLASS_KEYS = %i[th td].freeze
      DEFAULT_OPTIONS = { align: :left }.freeze

      def initialize(table, title, **options, &block)
        @table = table
        @title = title
        @custom_classes = resolve_custom_classes(options.delete(:class))
        @block = block
        build_options(options)
      end

      delegate :call, to: :@block

      def th_classes
        attribute_classes(:th, key: :header)
      end

      def td_classes
        attribute_classes(:td, key: :body)
      end

      private

      def attribute_classes(attr, key:)
        merge_tailwind_classes([styles.dig(key, :column, :density, density),
                                styles.dig(key, :column, :alignment, align),
                                custom_classes[attr].to_s.split])
      end
    end
  end
end
