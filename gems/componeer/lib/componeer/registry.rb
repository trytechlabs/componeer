module Componeer
  class Registry
    delegate :key?, to: :components

    attr_reader :components

    def initialize
      @components = {}
    end

    def register(name, component_klazz)
      components[name] = component_klazz.to_s
    end

    def [](name)
      components[name].constantize
    end
  end
end
