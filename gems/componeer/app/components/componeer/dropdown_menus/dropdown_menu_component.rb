require_relative 'item_component'

module Componeer
  module DropdownMenus
    class DropdownMenuComponent < BaseComponent
      register_as :dropdown_menu

      renders_many :items, ItemComponent
      renders_one :trigger
    end
  end
end
