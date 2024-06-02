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
        [styles.dig(:header, :column, :density, density),
         styles.dig(:header, :column, :alignment, alignment),
         custom_classes[:th].to_s.split].flatten.compact_blank.uniq.join(' ')
      end

      def td_classes
        [styles.dig(:body, :column, :density, density),
         styles.dig(:body, :column, :alignment, alignment),
         custom_classes[:td].to_s.split].flatten.compact_blank.uniq.join(' ')
      end

      private

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
