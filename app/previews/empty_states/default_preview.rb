module EmptyStates
  class DefaultPreview < ApplicationPreview
    # Very basic button
    # @!group Basic
    def basic
      componeer.empty_state(resource_name: 'Article')
    end

    def without_icon
      componeer.empty_state(resource_name: 'Article', icon: nil)
    end

    def using_another_icon
      componeer.empty_state(resource_name: 'Article', icon: :information_circle)
    end

    def using_new_resource_path
      componeer.empty_state(resource_name: 'Article', new_resource_path: '#')
    end
  end
end
