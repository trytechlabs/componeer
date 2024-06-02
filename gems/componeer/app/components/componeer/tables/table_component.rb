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

      attr_reader :records, :striped, :tr_classes, :th_classes, :td_classes, :wrapper_classes,
                  :table_classes, :options

      DEFAULT_WRAPPER_CLASSES = 'w-full flex flex-col overflow-x-auto align-middle min-w-full ' \
                                'border-b border-gray-200 py-2'.freeze
      DEFAULT_TABLE_CLASSES = 'min-w-full divide-y divide-gray-200 bg-white'.freeze
      DEFAULT_TH_CLASSES = 'px-3 py-2 text-xs font-medium uppercase tracking-wider'.freeze

      def initialize(records: nil, striped: true, options: {})
        @records = records
        @striped = striped
        @wrapper_classes = options.delete(:wrapper_classes) || DEFAULT_WRAPPER_CLASSES
        @table_classes = options.delete(:table_classes) || DEFAULT_TABLE_CLASSES
        @tr_classes = options.delete(:tr_classes) || ''
        @th_classes = options.delete(:th_classes) || DEFAULT_TH_CLASSES
        @td_classes = options.delete(:td_classes) || ''
        @options = options
      end

      def column_th_classes(column)
        "#{th_classes} #{column.classes_for(:th)}"
      end
    end
  end
end
