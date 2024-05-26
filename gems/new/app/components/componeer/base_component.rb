module Componeer
  class BaseComponent < ViewComponent::Base
    private

    def resolve_params(content_or_options, options)
      case content_or_options
      when Hash then [nil, content_or_options]
      else [content_or_options, options]
      end
    end

    def classes
      [base_class,
       resolve_state_classes(base_class),
       @options[:class]].flatten.compact_blank.join(' ')
    end

    def resolve_state_classes(base_class)
      state_classes.select { |(_state_class, condition)| condition }
                   .map { |state_class, _| "#{base_class}--#{state_class}" }
    end

    def base_class
      raise NotImplementedError
    end

    def state_classes
      []
    end
  end
end
