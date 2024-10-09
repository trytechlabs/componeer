require_relative 'item_component'

module Componeer
  module DropdownMenus
    class DropdownMenuComponent < BaseComponent
      register_as :dropdown_menu

      renders_many :items, ItemComponent

      DEFAULT_ALIGNMENT = { x: :right, y: :down }.freeze

      def initialize(alignment: {})
        @alignment = alignment.reverse_merge(DEFAULT_ALIGNMENT)
        @x_alignment = @alignment[:x]
        @y_alignment = @alignment[:y]
      end

      def x_alignment_classes = styles.dig(:menu, :alignment, :x, @x_alignment)
      def y_alignment_classes = styles.dig(:menu, :alignment, :y, @y_alignment)
    end
  end
end
