module Tags
  class DefaultPreview < ApplicationPreview
    # Default Tag
    # @!group Default
    def default
      componeer.tag('foo')
    end

    def small
      componeer.tag('foo', size: :small)
    end

    def flat
      componeer.tag('foo', shape: :flat)
    end

    def circle
      componeer.tag(lorem(20), shape: :circle, class: 'bg-purple-600 text-white')
    end

    def large
      componeer.tag('foo', size: :large)
    end

    def blue
      componeer.tag('foo', color: :blue)
    end

    def green
      componeer.tag('foo', color: :green)
    end

    def yellow
      componeer.tag('foo', color: :yellow)
    end

    def brand
      componeer.tag('foo', color: :brand)
    end

    def red
      componeer.tag('foo', color: :red)
    end

    def purple
      componeer.tag('foo', color: :purple)
    end

    def with_block
      componeer.tag do
        <<~HTML
          foo
          bar
        HTML
      end
    end
  end
end
