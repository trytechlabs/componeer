ENV['RAILS_ENV'] ||= 'test'

require File.expand_path('../config/environment', __dir__)

abort('The Rails environment is running in production mode!') if Rails.env.production?
require 'rspec/rails'

Rails.application.load_tasks

Dir[Rails.root.join('spec/support/**/*.rb')].each { |f| require f }

MaintainTestAssets.maintain!

RSpec.configure do |config|
  config.fixture_path = Rails.root.join('spec/fixtures').to_s
  config.file_fixture_path = 'spec/fixtures'
  config.use_transactional_fixtures = true
  config.infer_spec_type_from_file_location!
  config.filter_rails_from_backtrace!
end
