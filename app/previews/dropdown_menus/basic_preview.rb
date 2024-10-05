module DropdownMenus
  class BasicPreview < ApplicationPreview
    # Very basic dropdown
    # @!group Basic
    def default
      componeer.dropdown_menu do |dropdown|
        dropdown.with_item(url: '#', text: 'Using text', class: 'underline text-blue-500')
        dropdown.with_item(url: '#') do
          <<~HTML.html_safe
            <span class="underline text-yellow-600">Using block</span>
          HTML
        end

        <<~HTML.html_safe
          <button type="button" class="border rounded-md p-2">
            Dropdown Button
          </button>
        HTML
      end
    end
  end
end
