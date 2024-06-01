module Componeer
  class BaseComponent < ViewComponent::Base
    include Componeer::Helpers

    def self.register_as(name)
      Componeer.register(name.to_s.to_sym, self)
    end

    def resolve_params(content_or_options, options)
      if content_or_options.is_a?(Hash)
        [nil, content_or_options]
      else
        [content_or_options, options]
      end
    end

    def classes
      @classes ||= [base_classes, custom_classes].flatten.compact_blank.uniq.join(' ')
    end

    def custom_classes
      @custom_classes ||= options.delete(:class).to_s.split.compact_blank
    end

    def styles
      @styles ||= begin
        file_path = self.class.instance_method(:initialize).source_location[0]
        styles_yaml_file = Rails.root.join(File.dirname(file_path), 'styles.yml')

        File.exist?(styles_yaml_file) ? YAML.load(ERB.new(File.read(styles_yaml_file)).result) : {}
      end
    end

    def i18n(value, **options)
      I18n.t(value,
             scope: "componeer.#{self.class.to_s.demodulize.underscore.gsub('_component', '')}",
             **options)
    end
  end
end
