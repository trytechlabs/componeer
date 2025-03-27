module Componeer
  class Configuration
    attr_writer :include_componeer_helpers

    def include_componeer_helpers?
      @include_componeer_helpers ||= true

      @include_componeer_helpers.present?
    end
  end
end
