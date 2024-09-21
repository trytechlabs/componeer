module Componeer
  module Dropdowns
    class DropdownComponent < BaseComponent
      register_as :dropdown

      renders_many :items

      def initialize(**options); end
    end
  end
end
