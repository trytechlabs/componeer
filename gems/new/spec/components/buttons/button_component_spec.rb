describe Componeer::Buttons::ButtonComponent do
  context 'when default button' do
    it_behaves_like 'rendering component', fixture_file: 'default.html' do
      let(:component) { described_class.new('Click me') }
    end

    context 'and passing a block' do
      it_behaves_like 'rendering component', fixture_file: 'with_block.html' do
        let(:component) { described_class.new }
        let(:block) { -> { '<p>Hey guys!</p>'.html_safe } }
      end
    end
  end

  context 'when custom classes' do
    it_behaves_like 'rendering component', fixture_file: 'custom_classes.html' do
      let(:component) { described_class.new('Click me', class: 'custom-class another-class') }
    end
  end
end
