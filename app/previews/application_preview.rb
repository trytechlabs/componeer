class ApplicationPreview < ViewComponent::Preview
  include Componeer::Helpers

  private

  def lorem(number = 300)
    Faker::Lorem.paragraph_by_chars(number:, supplemental: false)
  end
end
