module Componeer
  module Tables
    class ColumnComponent < BaseComponent
      attr_reader :table, :title, :custom_classes, :alignment, :options
      delegate :density, to: :table

      CUSTOM_CLASS_KEYS = %i[th td].freeze

      def initialize(table, title, **options, &block)
        @table = table
        @title = title
        @custom_classes = resolve_custom_classes(options.delete(:class))
        @alignment = options.delete(:align) || :left
        @options = options
        @block = block
      end

      def call(record)
        @block.call(record)
      end

      def th_classes
        attribute_classes(:th, key: :header)
      end

      def td_classes
        attribute_classes(:td, key: :body)
      end

      private

      def attribute_classes(attr, key:)
        to_classes_string([styles.dig(key, :column, :density, density),
                           styles.dig(key, :column, :alignment, alignment),
                           custom_classes[attr].to_s.split])
      end
    end
  end
end
