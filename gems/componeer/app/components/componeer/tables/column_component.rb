module Componeer
  module Tables
    class ColumnComponent < BaseComponent
      attr_reader :table, :title, :custom_classes, :alignment, :options
      delegate :density, to: :table

      def initialize(table, title, **options, &block)
        @table = table
        @title = title
        @custom_classes = resolve_classes(options.delete(:class)) || {}
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
        [styles.dig(key, :column, :density, density),
         styles.dig(key, :column, :alignment, alignment),
         custom_classes[attr].to_s.split].flatten.compact_blank.uniq.join(' ')
      end

      def resolve_classes(hash_or_string)
        if hash_or_string.is_a?(String)
          { th: hash_or_string, td: hash_or_string }
        else
          hash_or_string
        end
      end
    end
  end
end
