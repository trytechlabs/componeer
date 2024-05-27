require 'componeer/version'
require 'componeer/engine'
require 'componeer/configuration'
require 'componeer/helpers'
require 'componeer/registry'

module Componeer
  def self.config
    @config ||= Configuration.new.tap do |config|
      yield config if block_given?
    end
  end

  def self.registry
    @registry ||= Registry.new
  end

  def self.register(*args)
    registry.register(*args)
  end

  def self.eager_load!
    path = File.expand_path('../app/components/**/*.rb', __dir__)

    Dir[path].each { |file| require_dependency file }
  end
end
