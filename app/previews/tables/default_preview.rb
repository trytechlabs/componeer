module Tables
  class DefaultPreview < ApplicationPreview
    Record = Struct.new(:name, :age, :gender)
    # Very basic button
    # @!group Basic
    def basic
      records = [Record.new('John', '18', 'male'), Record.new('Mary', '22', 'female')]

      componeer.table(records:) do |table|
        table.with_column(title: 'Name') { |record| record.name }
        table.with_column(title: 'Age') { |record| record.age }
        table.with_column(title: 'Gender') { |record| record.gender }
      end
    end
  end
end
