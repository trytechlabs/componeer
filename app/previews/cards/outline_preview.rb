module Cards
  class OutlinePreview < ApplicationPreview
    # Very basic card
    # @!group outline
    def default
      componeer.card(header_text: 'Card Title', body_text: 'Card Body', mode: :outline)
    end

    def small
      componeer.card(header_text: 'Card Title', body_text: 'Card Body', size: :small,
                     mode: :outline)
    end

    def brand_color
      componeer.card(header_text: 'Card Title', body_text: lorem, color: :brand, mode: :outline)
    end

    def info_color
      componeer.card(header_text: 'Card Title', body_text: lorem, color: :info, mode: :outline)
    end

    def using_custom_classes_separated
      componeer.card(header_text: 'Card Title', body_text: lorem,
                     class: { header: 'text-green-600', body: 'text-purple-700' }, mode: :outline)
    end

    def using_blocks
      componeer.card(mode: :outline) do |card|
        card.with_header('Card Title') do
          '<span>Header html</span>'.html_safe
        end

        card.with_body do
          '<div class="text-purple-800">Body html</div>'.html_safe
        end
      end
    end

    private

    def lorem(number = 300)
      Faker::Lorem.paragraph_by_chars(number:, supplemental: false)
    end
  end
end
