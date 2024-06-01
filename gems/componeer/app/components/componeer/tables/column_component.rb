module Componeer
  module Tables
    class ColumnComponent < BaseComponent
      attr_reader :title, :css_class, :link, :th_css_class, :td_css_class

      def initialize(title, options = {}, &block)
        @title = title
        @css_class = options[:css_class].presence || 'text-left'
        @th_css_class = options[:th_css_class].presence
        @td_css_class = options[:td_css_class].presence
        @link = options[:link]
        @block = block
      end

      def call(record)
        @block.call(record)
      end
    end
  end
end
