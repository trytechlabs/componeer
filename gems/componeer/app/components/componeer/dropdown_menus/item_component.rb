module Componeer
  module DropdownMenus
    class ItemComponent < BaseComponent
      DEFAULT_LINK_CLASSES = %w[w-full px-5 py-2 text-sm leading-5 font-normal text-gray-700
                                hover:bg-gray-100].freeze

      delegate :link_to_confirm, to: :helpers

      def initialize(url:, link_type: :link_to, text: nil, **options)
        @url = url
        @link_type = link_type
        @text = text
        @options = options
      end

      def link_arguments
        { class: merge_tailwind_classes(DEFAULT_LINK_CLASSES, @options[:class]) }
      end
    end
  end
end
