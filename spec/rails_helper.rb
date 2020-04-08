# frozen_string_literal: true

# This file is copied to spec/ when you run 'rails generate rspec:install'
require 'spec_helper'
require 'simplecov'

SimpleCov.start do
  minimum_coverage 95
  add_filter '/admin/'
end
ENV['RAILS_ENV'] ||= 'test'

require File.expand_path('../config/environment', __dir__)

# Prevent database truncation if the environment is production
abort('The Rails environment is running in production mode!') if Rails.env.production?
require 'rspec/rails'

Dir[Rails.root.join('spec', 'support', '**', '*.rb')].each(&method(:require))

begin
  ActiveRecord::Migration.maintain_test_schema!
rescue ActiveRecord::PendingMigrationError => e
  puts e.to_s.strip
  exit 1
end
RSpec.configure do |config|
  config.include FactoryBot::Syntax::Methods
  config.include Devise::Test::ControllerHelpers, type: :controller
  config.include Warden::Test::Helpers
  config.include CheckoutHelper, type: :feature
  config.include SessionHelper, type: :feature

  # Remove this line if you're not using ActiveRecord or ActiveRecord fixtures
  config.fixture_path = "#{::Rails.root}/spec/fixtures"
  # If you're not using ActiveRecord, or you'd prefer not to run each of your
  # examples within a transaction, remove the following line or assign false
  # instead of true.
  config.use_transactional_fixtures = true
  config.infer_spec_type_from_file_location!

  # Filter lines from Rails gems in backtraces.
  config.filter_rails_from_backtrace!
  # arbitrary gems may also be filtered via:
  # config.filter_gems_from_backtrace("gem name")
  config.after :each do
    Warden.test_reset!
  end
end
Shoulda::Matchers.configure do |config|
  config.integrate do |with|
    with.test_framework :rspec
    with.library :rails
  end
end

Capybara.register_driver :site_prism do |app|
  browser = ENV.fetch('browser', 'chrome').to_sym
  capabilities = Selenium::WebDriver::Remote::Capabilities.chrome(
    chromeOptions: { args: %w[headless disable-gpu] }
  )
  Capybara::Selenium::Driver.new(app, browser: browser, desired_capabilities: capabilities)
end

Capybara.register_driver :selenium do |app|
  if ENV['SELENIUM_DRIVER_URL'].present?
    Capybara::Selenium::Driver.new(
      app,
      browser: :remote,
      url: ENV.fetch('SELENIUM_DRIVER_URL'),
      desired_capabilities: :chrome
    )
  else
    Capybara::Selenium::Driver.new(app, browser: :chrome)
  end
end

Capybara.configure do |config|
  config.default_driver = :site_prism
end

Capybara.javascript_driver = :site_prism
