require 'spec_helper'
ENV['RAILS_ENV'] ||= 'test'
require_relative '../config/environment'
abort("The Rails environment is running in production mode!") if Rails.env.production?
require 'rspec/rails'

Rails.root.glob('spec/support/**/*.rb').sort_by(&:to_s).each { |f| require f }

begin
  ActiveRecord::Migration.maintain_test_schema!
rescue ActiveRecord::PendingMigrationError => e
  abort e.to_s.strip
end

RSpec.configure do |config|
  config.fixture_paths = [ Rails.root.join('spec/fixtures') ]
  config.use_transactional_fixtures = true
  # config.use_active_record = false # Uncomment if not using ActiveRecord
  # config.infer_spec_type_from_file_location! # Uncomment to infer spec type by file location
  config.filter_rails_from_backtrace!
  # config.filter_gems_from_backtrace("gem name")

  config.include FactoryBot::Syntax::Methods

  Shoulda::Matchers.configure do |with|
    with.integrate do |config|
      config.test_framework :rspec
      config.library :rails
    end
  end
end
