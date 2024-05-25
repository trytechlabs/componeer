class ButtonsComponentPreview < Lookbook::Preview
  def default
    render Componeer::Buttons::ButtonComponent.new('Default')
  end

  def secondary
    render Componeer::Buttons::ButtonComponent.new('Secondary', mode: :secondary)
  end

  def with_block
    render Componeer::Buttons::ButtonComponent.new do
      '<p class="bg-red-200">Hello from p tag</p>'.html_safe
    end
  end
end
