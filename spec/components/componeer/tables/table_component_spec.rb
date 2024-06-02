require 'rails_helper'

Record = Struct.new(:name, :age)

describe Componeer::Tables::TableComponent, type: :component do
  subject(:render) { render_inline(component) }

  let(:component) do
    described_class.new(records:) do |table|
      table.with_column(title: 'Name', &:name)
      table.with_column(title: 'Age', &:age)
    end
  end
  let(:records) { [Record.new('John', 18), Record.new('Mary', 21)] }

  it { is_expected.to have_table }

  it do
    within('table') do
      is_expected.to have_css('thead')
    end
  end

  it do
    within('table') do
      is_expected.to have_css('tbody')
    end
  end

  it do
    within('table') do
      is_expected.to have_css('p-3 text-sm font-semibold')
    end
  end

  it do
    within('table') do
      is_expected.to have_text('John')
    end
  end

  context 'when compact table' do
    let(:component) do
      described_class.new(records:, density: :compacty) do |table|
        table.with_column(title: 'Name', &:name)
        table.with_column(title: 'Age', &:age)
      end
    end

    it do
      within('table') do
        is_expected.to have_css('p-1.5 text-xs font-semibold')
      end
    end
  end

  context 'when using custom align' do
    let(:component) do
      described_class.new(records:) do |table|
        table.with_column(title: 'Name', &:name)
        table.with_column(title: 'Age', align: :center, &:age)
      end
    end

    it do
      within('table') do
        is_expected.to have_css('text-center')
      end
    end
  end

  context 'when using custom column classes' do
    let(:component) do
      described_class.new(records:) do |table|
        table.with_column(title: 'Name', class: 'w-32', &:name)
        table.with_column(title: 'Age', class: { th: 'uppercase', td: 'text-green-700' }, &:age)
      end
    end

    it do
      within('table') do
        within('th') do
          is_expected.to have_css('uppercase')
        end
      end
    end

    it do
      within('table') do
        within('th') do
          is_expected.to have_css('w-32')
        end
      end
    end

    it do
      within('table') do
        within('td') do
          is_expected.to have_css('uppercase')
        end
      end
    end

    it do
      within('table') do
        within('td') do
          is_expected.to have_css('w-32')
        end
      end
    end

    it do
      within('table') do
        within('td') do
          is_expected.to have_no_css('uppercase')
        end
      end
    end

    it do
      within('table') do
        within('td') do
          is_expected.to have_no_css('text-green-700')
        end
      end
    end
  end
end
