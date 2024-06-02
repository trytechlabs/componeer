module Componeer
  module Tables
    class ColumnComponent < BaseComponent
      attr_reader :title, :base_classes, :link, :th_classes, :td_classes

      def initialize(title, options = {}, &block)
        @title = title
        @link = options[:link]
        @base_classes = options[:base_classes] || 'text-left'
        @th_classes = options[:th_classes]
        @td_classes = options[:td_classes]
        @block = block
      end

      def call(record)
        @block.call(record)
      end

      def classes_for(attr)
        "#{base_classes} #{send("#{attr}_classes")}"
      end
    end
  end
end
