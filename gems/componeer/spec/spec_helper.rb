# frozen_string_literal: true

require 'combustion'
require 'debug'
require 'inline_svg'

Combustion.path = 'spec/dummy'
Combustion.initialize! :all

require 'kaminari'
require 'componeer'
require 'rspec/rails'

Dir[Componeer::Engine.root.join('spec/support/**/*.rb')].each { |f| require f }

RSpec.configure do |config|
  config.use_transactional_fixtures = true

  config.expect_with :rspec do |c|
    c.syntax = :expect
  end

  config.order = :random
end
