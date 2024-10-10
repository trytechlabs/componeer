module Componeer
  module DropdownMenus
    class ItemComponent < BaseComponent
      def initialize(url:, link_type: :link_to, text: nil, **options)
        @url = url
        @link_type = link_type
        @text = text
        @options = options
      end

      def base_classes
        [styles[:item]]
      end
    end
  end
end
