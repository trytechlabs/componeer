module Componeer
  module Labels
    class LabelComponent < BaseComponent
      attr_reader :name, :text

      def initialize(name, content_or_options = nil, options = {})
        @name = name
        @text, @options = resolve_params(content_or_options, options)
      end

      def options
        @options.reverse_merge(class: classes)
      end

      private

      def base_class
        'componeer-label'
      end
    end
  end
end
