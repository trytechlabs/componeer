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

        componeer.button('Dropdown Button')
      end
    end

    def aligned_to_left
      componeer.dropdown_menu(alignment: { x: :left }) do |dropdown|
        dropdown.with_item(url: '#', text: 'Using text', class: 'underline text-blue-500')
        dropdown.with_item(url: '#') do
          <<~HTML.html_safe
            <span class="underline text-yellow-600">Using block</span>
          HTML
        end

        componeer.button('Dropdown Button', color: :yellow)
      end
    end

    def aligned_to_top
      componeer.dropdown_menu(alignment: { y: :up }) do |dropdown|
        dropdown.with_item(url: '#', text: 'Using text', class: 'underline text-blue-500')
        dropdown.with_item(url: '#') do
          <<~HTML.html_safe
            <span class="underline text-yellow-600">Using block</span>
          HTML
        end

        componeer.button('Dropdown Button', color: :red)
      end
    end

    def aligned_to_top_and_left
      componeer.dropdown_menu(alignment: { y: :up, x: :left }) do |dropdown|
        dropdown.with_item(url: '#', text: 'Using text', class: 'underline text-blue-500')
        dropdown.with_item(url: '#') do
          <<~HTML.html_safe
            <span class="underline text-yellow-600">Using block</span>
          HTML
        end

        componeer.button('Dropdown Button', color: :green)
      end
    end
  end
end
