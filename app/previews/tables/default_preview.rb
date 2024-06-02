module Tables
  class DefaultPreview < ApplicationPreview
    Record = Struct.new(:name, :age, :gender)
    # Very basic button
    # @!group Basic
    def basic
      records = [Record.new('John', '18', 'male'), Record.new('Mary', '22', 'female')]

      componeer.table(records:) do |table|
        table.with_column(title: 'Name', &:name)
        table.with_column(title: 'Age', &:age)
        table.with_column(title: 'Gender', &:gender)
      end
    end

    def not_striped
      records = [Record.new('John', '18', 'male'), Record.new('Mary', '22', 'female')]

      componeer.table(records:, striped: false) do |table|
        table.with_column(title: 'Name', &:name)
        table.with_column(title: 'Age', &:age)
        table.with_column(title: 'Gender', &:gender)
      end
    end

    def with_empty_state
      componeer.table(records: []) do |table|
        table.with_empty_state(resource_name: 'user')

        table.with_column(title: 'Name', &:name)
        table.with_column(title: 'Age', &:age)
        table.with_column(title: 'Gender', &:gender)
      end
    end
  end
end
