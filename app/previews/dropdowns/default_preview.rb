module Dropdowns
  class DefaultPreview < ApplicationPreview
    # Very basic dropdown
    # @!group Default
    def default
      componeer.dropdown do |dropdown|
        dropdown.with_item do
          componeer.button('Item 1')
        end

        '<button type="button">dropdown</button>'.html_safe
      end
    end
  end
end
