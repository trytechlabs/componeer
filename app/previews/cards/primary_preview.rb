module Cards
  class PrimaryPreview < ApplicationPreview
    # Very basic card
    # @!group Primary
    def default
      componeer.card(header_text: 'Card Title', body_text: 'Card Body')
    end

    def small
      componeer.card(header_text: 'Card Title', body_text: 'Card Body', size: :small)
    end

    def brand_color
      componeer.card(header_text: 'Card Title', body_text: lorem, color: :brand)
    end

    def info_color
      componeer.card(header_text: 'Card Title', body_text: lorem, color: :info)
    end

    def warning_color
      componeer.card(header_text: 'Card Title', body_text: lorem, color: :warning)
    end

    def danger_color
      componeer.card(header_text: 'Card Title', body_text: lorem, color: :danger)
    end

    def using_custom_classes
      componeer.card(header_text: 'Card Title', body_text: lorem, class: 'w-96')
    end

    def using_custom_classes_separated
      componeer.card(header_text: 'Card Title', body_text: lorem,
                     class: { header: 'bg-purple-100', body: 'text-purple-700' })
    end

    def using_blocks
      componeer.card do |card|
        card.with_header('Card Title') do
          '<span>Header html</span>'.html_safe
        end

        card.with_body do
          '<div class="text-purple-800">Body html</div>'.html_safe
        end
      end
    end

    def without_headers
      componeer.card(class: 'shadow-md') do |card|
        card.with_body do
          '<div class="text-purple-600">Body html</div>'.html_safe
        end
      end
    end

    private

    def lorem(number = 300)
      Faker::Lorem.paragraph_by_chars(number:, supplemental: false)
    end
  end
end
