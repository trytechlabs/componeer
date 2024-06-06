require 'rails_helper'

describe Componeer::Cards::CardComponent, type: :component do
  context 'when primary basic' do
    subject(:render) do
      render_inline(described_class.new(header_text: 'Card Title', body_text: 'Card Body'))
    end

    let(:headers_classes) do
      'text-sm px-3 py-2 bg-gray-50 text-gray-800 border-gray-300 font-semibold border-b ' \
        'rounded-t-lg'
    end

    let(:body_classes) do
      'text-sm px-3 py-2 bg-gray-50 text-gray-800 border-gray-300 font-normal rounded-b-lg'
    end

    it { is_expected.to have_text('Card Title') }
    it { is_expected.to have_text('Card Body') }
    it { is_expected.to match(headers_classes) }
    it { is_expected.to match(body_classes) }
  end

  context 'when small size' do
    subject(:render) do
      render_inline(described_class.new(header_text: 'Card Title', body_text: 'Card Body',
                                        size: :small))
    end

    it { is_expected.to match('text-xs') }
    it { is_expected.not_to match('text-sm') }
  end

  context 'when using some predefined color' do
    subject(:render) do
      render_inline(described_class.new(header_text: 'Card Title', body_text: 'Card Body',
                                        color: :info))
    end

    it { is_expected.to match('bg-cyan-50 text-cyan-800 border-cyan-300') }
  end

  context 'when outline mode' do
    subject(:render) do
      render_inline(described_class.new(header_text: 'Card Title', body_text: 'Card Body',
                                        mode: :outline))
    end

    let(:header_styles) do
      'text-sm px-3 py-2 bg-white text-gray-800 border-gray-300 font-semibold border rounded-t-lg'
    end

    let(:body_styles) do
      'text-sm px-3 py-2 bg-white text-gray-800 border-gray-300 font-normal border border-t-0 ' \
        'rounded-b-lg'
    end

    it { is_expected.to match(header_styles) }
    it { is_expected.to match(body_styles) }
  end
end
