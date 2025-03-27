require 'tailwind_merge'

module Componeer
  class BaseComponent < ViewComponent::Base
    include Componeer::Helpers

    attr_reader :options

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

        if File.exist?(styles_yaml_file)
          file_content = ERB.new(File.read(styles_yaml_file)).result
          YAML.load(file_content).with_indifferent_access
        else
          {}
        end
      end
    end

    def i18n(value, **options)
      I18n.t(value,
             scope: "componeer.#{self.class.to_s.demodulize.underscore.gsub('_component', '')}",
             **options)
    end

    def merge_tailwind_classes(*classes)
      TailwindMerge::Merger.new.merge(to_classes_string(classes))
    end

    def to_classes_string(array)
      flattenize(array).join(' ')
    end

    private

    def build_options(opts)
      opts = opts.reverse_merge(self.class::DEFAULT_OPTIONS)

      opts.each do |k, v|
        instance_variable_set(:"@#{k}", v)
        opts.delete(k)
      end

      @options = opts
    end

    def resolve_custom_classes(string_or_hash)
      return {} unless string_or_hash

      if string_or_hash.is_a?(String)
        self.class::CUSTOM_CLASS_KEYS.index_with { |_key| string_or_hash }
      else
        string_or_hash
      end
    end

    def flattenize(array)
      [array].flatten.compact_blank.uniq
    end
  end
end
