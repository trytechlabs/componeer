module Componeer
  module Tables
    class TableComponent < BaseComponent
      register_as :table

      renders_many :columns,
                   lambda { |title: '', **options, &block|
                     ColumnComponent.new(title, options, &block)
                   }

      renders_one :empty_state,
                  lambda { |resource_name: nil, icon: :exclamation|
                    EmptyStates::EmptyStateComponent.new(resource_name: resource_name ||
                                                                       records_resource_name,
                                                         icon:)
                  }

      renders_one :footer

      def initialize(records: nil, striped: true, options: {})
        @records = records
        @striped = striped
        @options = options.reverse_merge(border: 'border-b')
      end

      def record_ids
        ids = @records&.map { |record| record_id(record) } || []

        ids&.all?(&:present?) ? ids : []
      end

      def record_id(record)
        if @batch_actions_record_id
          @batch_actions_record_id.call(record)
        else
          record.try(:id)
        end
      end

      def records_resource_name
        @records.name.underscore.humanize.downcase
      end
    end
  end
end
