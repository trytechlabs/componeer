require 'rails_helper'

Record = Struct.new(:name, :age)

describe Componeer::Tables::TableComponent, type: :component do
  subject(:rendered) do
    render_inline(described_class.new(records:)) do |table|
      table.with_column(title: 'Name', &:name)
      table.with_column(title: 'Age', &:age)
    end
  end

  let(:records) { [Record.new('John', '18'), Record.new('Mary', '21')] }

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
    subject(:rendered) do
      render_inline(described_class.new(records:, density: :compacty)) do |table|
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
    subject(:rendered) do
      render_inline(described_class.new(records:, density: :compacty)) do |table|
        table.with_column(title: 'Name', &:name)
        table.with_column(title: 'Age', &:age)
      end
    end

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
    subject(:rendered) do
      render_inline(described_class.new(records:)) do |table|
        table.with_column(title: 'Name', class: 'w-32', &:name)
        table.with_column(title: 'Age', class: { th: 'uppercase', td: 'text-green-700' }, &:age)
      end
    end

    let(:expected_content) do
      <<~HTML.squish
        <table class="w-full">
          <thead>
            <tr class="bg-white border-b border-gray-200">
              <th scope="col" class="p-3 text-sm font-semibold text-left w-32">
                Name
              </th>
              <th scope="col" class="p-3 text-sm font-semibold text-left uppercase">
                Age
              </th>
            </tr>
          </thead>

          <tbody>
            <tr class="bg-gray-50" >
              <td class="p-3 text-sm font-normal text-left w-32">
                John
              </td>
              <td class="p-3 text-sm font-normal text-left text-green-700">
                18
              </td>
            </tr>
            <tr  class="bg-white"
            >
            <td class="p-3 text-sm font-normal text-left w-32">
              Mary
            </td>
            <td class="p-3 text-sm font-normal text-left text-green-700">
              21
            </td>
            </tr>
          </tbody>
          <tfoot></tfoot>
        </table>
      HTML
    end

    it { expect(rendered.squish).to eq(expected_content) }
  end
end
