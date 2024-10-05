module Buttons
  class BasicPreview < ApplicationPreview
    # Very basic button
    # @!group Basic
    def brand
      componeer.button('Basic')
    end

    def green
      componeer.button('Basic', color: :green)
    end

    def red
      componeer.button('Basic', color: :red)
    end

    def blue
      componeer.button('Basic', color: :blue)
    end

    def yellow
      componeer.button('Basic', color: :yellow)
    end

    def orange
      componeer.button('Basic', color: :orange)
    end

    # Button with block content
    def with_block
      componeer.button do
        <<~HTML.html_safe
          <p class="underline">Hello from p tag</p>
        HTML
      end
    end
  end
end
