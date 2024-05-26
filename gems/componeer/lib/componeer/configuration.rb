module Componeer
  class Configuration
    attr_writer :enable_lookbook

    def lookbook_enabled?
      @enable_lookbook || false
    end
  end
end
