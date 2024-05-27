require 'rails_helper'

describe Componeer::Buttons::ButtonComponent, type: :component do
  context 'when only text is defined' do
    subject(:render) { render_inline(described_class.new(content_or_options, options)) }

    let(:content_or_options) { 'Click me' }
    let(:options) { {} }

    it { is_expected.to have_button(text: 'Click me', class: 'text-brand-500') }
  end

  context 'when content is defined by a block' do
    subject(:render) { render_inline(described_class.new(options)) { 'Click me (block version)' } }

    let(:options) { {} }

    it { is_expected.to have_button(text: 'Click me (block version)') }
  end

  context 'when color is defined' do
    subject(:render) { render_inline(described_class.new('Click me', options)) }

    let(:options) { { color: :green } }

    it { is_expected.to have_button(text: 'Click me', class: 'text-green-500') }
  end

  context 'when primary is defined' do
    subject(:render) { render_inline(described_class.new('Click me', options)) }

    let(:options) { { primary: true } }

    it { is_expected.to have_button(text: 'Click me', class: 'bg-brand-500') }
  end

  context 'when size is defined' do
    subject(:render) { render_inline(described_class.new('Click me', options)) }

    let(:options) { { size: :large } }

    it { is_expected.to have_button(text: 'Click me', class: 'text-base') }
  end

  context 'when shape is defined' do
    subject(:render) { render_inline(described_class.new('Click me', options)) }

    let(:options) { { shape: :flat } }

    it { is_expected.to have_button(text: 'Click me', class: 'rounded-none') }
  end
end
