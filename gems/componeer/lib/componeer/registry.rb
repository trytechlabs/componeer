module Componeer
  def self.register(*args)
    registry.register(*args)
  end

  def self.registry
    @registry ||= Registry.new
  end

  class Registry
    delegate :key?, to: :@components

    def initialize
      @components = {}
    end

    def register(name, component_klazz)
      @components[name] = component_klazz
    end

    def [](name)
      @components[name]
    end
  end
end
