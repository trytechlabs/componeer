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

  context 'when using resource path' do
    subject(:render) { render_inline(described_class.new(resource_name:, new_resource_path:)) }

    let(:resource_name) { 'Article' }
    let(:new_resource_path) { '/articles/new' }

    it { is_expected.to have_xpath('//svg') }
    it { is_expected.to have_text('No Articles') }
    it { is_expected.to have_text('Get started by creating a new Article.') }
    it { is_expected.to have_link('New Article', href: new_resource_path) }
  end
end
