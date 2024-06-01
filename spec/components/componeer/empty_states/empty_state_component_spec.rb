require 'rails_helper'

describe Componeer::EmptyStates::EmptyStateComponent, type: :component do
  context 'when basic' do
    subject(:render) { render_inline(described_class.new(resource_name:)) }

    let(:resource_name) { 'Article' }

    it { is_expected.to have_xpath('//svg') }
    it { is_expected.to have_text('No Articles') }
  end

  context 'when icon is nil' do
    subject(:render) { render_inline(described_class.new(resource_name:, icon: nil)) }

    let(:resource_name) { 'Article' }

    it { is_expected.to have_no_xpath('//svg') }
    it { is_expected.to have_text('No Articles') }
  end

  context 'with new_resource_action' do
    subject(:render) do
      render_inline(described_class.new(resource_name:)) do |component|
        component.with_new_resource_action do
          'This is a new resource action with block'
        end
      end
    end

    let(:resource_name) { 'Article' }

    it { is_expected.to have_xpath('//svg') }
    it { is_expected.to have_text('No Articles') }
    it { is_expected.to have_text('This is a new resource action with block') }
  end
end
