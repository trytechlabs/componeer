module Buttons
  class PrimaryPreview < ApplicationPreview
    # Primary button
    # @!group Primary
    def brand
      componeer.button('Primary', primary: true)
    end

    def green
      componeer.button('Primary', primary: true, color: :green)
    end

    def red
      componeer.button('Primary', primary: true, color: :red)
    end

    def blue
      componeer.button('Primary', primary: true, color: :blue)
    end

    def yellow
      componeer.button('Primary', primary: true, color: :yellow)
    end

    def orange
      componeer.button('Primary', primary: true, color: :orange)
    end

    # Button with block content
    def with_block
      componeer.button(primary: true) do
        '<p class="underline">Hello from p tag</p>'.html_safe
      end
    end
  end
end
