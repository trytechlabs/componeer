class LabelComponentPreview < Lookbook::Preview
  def default
    render Componeer::Labels::LabelComponent.new(:default)
  end

  def secondary
    render Componeer::Labels::LabelComponent.new(:secondary, mode: :secondary)
  end

  def with_custom_classes
    render Componeer::Labels::LabelComponent.new(:secondary, mode: :secondary,
                                                             class: 'text-gray-500')
  end

  def with_block
    render Componeer::Labels::LabelComponent.new(:with_block) do
      '<span>Hello from p tag</span>'.html_safe
    end
  end
end
