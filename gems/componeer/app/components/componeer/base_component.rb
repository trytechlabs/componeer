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

        File.exist?(styles_yaml_file) ? YAML.load(ERB.new(File.read(styles_yaml_file)).result) : {}
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

    def class_names(*args)
      classes = []

      args.each { |class_name| process_class_name(class_name, classes) }

      classes.compact_blank.uniq.join(' ')
    end

    private

    def build_options(opts)
      opts = opts.reverse_merge(self.class::DEFAULT_OPTIONS)

      opts.each do |k, v|
        instance_variable_set("@#{k}", v)
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

    def process_class_name(class_name, classes)
      case class_name
      when Hash then process_hash_class_name(class_name, classes)
      when Array then process_array_class_name(class_name, classes)
      else process_string_class_name(class_name, classes)
      end
    end

    def process_hash_class_name(class_name, classes)
      class_name.each do |key, value|
        process_string_class_name(key, classes) if value
      end
    end

    def process_array_class_name(class_name, classes)
      class_name.each do |name|
        process_class_name(name, classes)
      end
    end

    def process_string_class_name(class_name, classes)
      classes << class_name
    end
  end
end
