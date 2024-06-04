module Componeer
  module Tables
    class TableComponent < BaseComponent
      register_as :table

      renders_many :columns,
                   lambda { |title: '', **options, &block|
                     ColumnComponent.new(self, title, **options, &block)
                   }

      renders_one :empty_state,
                  lambda { |resource_name: nil, icon: :exclamation|
                    EmptyStates::EmptyStateComponent.new(resource_name: resource_name ||
                                                                        records_resource_name,
                                                         icon:)
                  }

      renders_one :footer

      attr_reader :records, :density, :striped, :options

      DEFAULT_OPTIONS = { striped: true, density: :default }.freeze

      def initialize(records: nil, **options)
        @records = records
        build_options(options)
      end

      def tr_classes(level = :body)
        if level == :body
          styles.dig(level, :row, striped ? cycle(:striped, :default).to_sym : :default)
        else
          styles.dig(level, :row)
        end
      end
    end
  end
end
