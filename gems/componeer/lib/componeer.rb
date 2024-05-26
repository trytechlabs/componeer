
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
end
