require 'rails_helper'

describe Componeer::Tags::TagComponent, type: :component do
  context 'when default' do
    subject(:render) { render_inline(described_class.new('foo')) }

    it { is_expected.to have_css('span') }

    it do
      within('span') do
        is_expected.to have_class('text-gray-700')
      end
    end

    it do
      within('span') do
        is_expected.to have_class('bg-gray-50')
      end
    end

    it do
      within('span') do
        is_expected.to have_class('rounded-lg')
      end
    end

    context 'when using custom color' do
      subject(:render) { render_inline(described_class.new('foo', color: :blue)) }

      it { is_expected.to have_css('span') }

      it do
        within('span') do
          is_expected.to have_class('text-blue-700')
        end
      end

      it do
        within('span') do
          is_expected.to have_class('bg-blue-50')
        end
      end

      it do
        within('span') do
          is_expected.to have_class('rounded-lg')
        end
      end
    end
  end

  context 'when flat shape' do
    subject(:render) { render_inline(described_class.new('foo', shape: :flat)) }

    it { is_expected.to have_css('span') }

    it do
      within('span') do
        is_expected.to have_class('text-blue-700')
      end
    end

    it do
      within('span') do
        is_expected.to have_class('bg-blue-50')
      end
    end

    it do
      within('span') do
        is_expected.not_to have_class('rounded-lg')
      end
    end

    it do
      within('span') do
        is_expected.to have_class('rounded-none')
      end
    end
  end

  context 'when using block' do
    subject(:render) { render_inline(component) }

    let(:component) do
      described_class.new(color: :green) do
        'Foo'
      end
    end

    it { is_expected.to have_css('span') }

    it do
      within('span') do
        is_expected.to have_class('text-green-700')
      end
    end

    it do
      within('span') do
        is_expected.to have_class('bg-green-50')
      end
    end

    it do
      within('span') do
        is_expected.to have_class('rounded-lg')
      end
    end
  end

  context 'when using custom classes' do
    subject(:render) { render_inline(component) }

    let(:component) do
      described_class.new('Custom component', color: :green, class: 'bg-purple-300 text-white')
    end

    let(:expected_content) do
      <<~HTML
        <span class="text-sm px-2 py-1 rounded-lg bg-purple-300 text-white">
          Custom component
        </span>
      HTML
    end

    it { is_expected.to eq(expected_content) }
  end
end
