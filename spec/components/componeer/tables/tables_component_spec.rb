require 'rails_helper'

Record = Struct.new(:name)

describe Componeer::Tables::TableComponent, type: :component do
  subject(:render) { render_inline(component) }

  let(:component) do
    described_class.new(records:) do |table|
      table.with_column(title: 'Name') do |record|
        record.name
      end
    end
  end
  let(:records) { [Record.new('John'), Record.new('Mary')] }

  it { is_expected.to have_css('table') }

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
      is_expected.to have_text('John')
    end
  end
end
