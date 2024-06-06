module Cards
  class DefaultPreview < ApplicationPreview
    # Very basic card
    # @!group Basic
    def default
      componeer.card(header_text: 'Card Title', body_text: 'Card Body')
    end

    def small
      componeer.card(header_text: 'Card Title', body_text: 'Card Body', size: :small)
    end

    def brand_color
      componeer.card(header_text: 'Card Title', body_text: lorem, color: :brand)
    end

    def flat_shape
      componeer.card(header_text: 'Card Title', body_text: lorem, shape: :flat)
    end

    def with_custom_classes
      componeer.card(header_text: 'Card Title', body_text: lorem, color: :info, class: 'w-96')
    end

    def using_blocks
      componeer.card(class: 'w-96') do |card|
        card.with_header('Card Title') do
          '<p>This is a paragraph</p>'.html_safe
        end

        card.with_body do
          '<div>This is a div</div>'.html_safe
        end
      end
    end

    private

    def lorem(number = 300)
      Faker::Lorem.paragraph_by_chars(number:, supplemental: false)
    end
  end
end
