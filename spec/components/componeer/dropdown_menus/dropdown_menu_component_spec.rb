require 'rails_helper'

describe Componeer::DropdownMenus::DropdownMenuComponent, type: :component do
  let(:wrapper_classes) { 'relative inline-flex cursor-pointer' }

  context 'when default dropdown' do
    subject(:render) { render_inline(described_class.new) }

    let(:dropdown_classes) { 'z-1 absolute right-0 top-10' }

    it { is_expected.to match(wrapper_classes) }
    it { is_expected.to match(dropdown_classes) }
  end

  context 'when alignment to left' do
    subject(:render) { render_inline(described_class.new(alignment: { x: :left })) }

    let(:dropdown_classes) { 'z-1 absolute left-0 top-10' }

    it { is_expected.to match(wrapper_classes) }
    it { is_expected.to match(dropdown_classes) }
  end

  context 'when alignment to up' do
    subject(:render) { render_inline(described_class.new(alignment: { y: :up })) }

    let(:dropdown_classes) { 'z-1 absolute right-0 bottom-10' }

    it { is_expected.to match(wrapper_classes) }
    it { is_expected.to match(dropdown_classes) }
  end

  context 'when alignment to up and left' do
    subject(:render) { render_inline(described_class.new(alignment: { x: :left, y: :up })) }

    let(:dropdown_classes) { 'z-1 absolute left-0 bottom-10' }

    it { is_expected.to match(wrapper_classes) }
    it { is_expected.to match(dropdown_classes) }
  end
end
