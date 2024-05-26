describe Componeer::Labels::LabelComponent do
  context 'when default label' do
    it_behaves_like 'rendering component', fixture_file: 'default.html' do
      let(:component) { described_class.new('user_name', 'Username') }
    end

    context 'and passing a block' do
      it_behaves_like 'rendering component', fixture_file: 'with_block.html' do
        let(:component) { described_class.new('user_name') }
        let(:block) { -> { '<small>Required</small>'.html_safe } }
      end
    end
  end

  context 'when no text provided' do
    it_behaves_like 'rendering component', fixture_file: 'humanized.html' do
      let(:component) { described_class.new('user_name') }
    end
  end

  context 'when custom classes' do
    it_behaves_like 'rendering component', fixture_file: 'custom_classes.html' do
      let(:component) do
        described_class.new('user_name', 'Username',
                            class: 'custom-label-class another-label-class')
      end
    end
  end
end
