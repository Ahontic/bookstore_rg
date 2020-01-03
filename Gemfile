# frozen_string_literal: true

source 'https://rubygems.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby '2.6.3'

gem 'activeadmin'
gem 'bundler-audit'
gem 'country_select'
gem 'devise'
gem 'devise-security'
gem 'draper'
gem 'figaro'
gem 'haml-rails'
gem 'i18n'
gem 'omniauth-facebook'
gem 'omniauth-rails_csrf_protection'
gem 'pagy'
gem 'pg'
gem 'puma', '>= 4.3.1'
gem 'rails', '~> 6.0.1'
gem 'sass-rails', '>= 6'
gem 'sidekiq'
gem 'turbolinks', '~> 5'
gem 'webpacker', '~> 4.0'

gem 'bootsnap', '>= 1.4.2', require: false

group :development, :test do
  gem 'byebug', platforms: %i[mri mingw x64_mingw]
  gem 'factory_bot_rails'
  gem 'ffaker'
  gem 'rubocop'
  gem 'shoulda-matchers'
end

group :development do
  gem 'annotate'
  gem 'brakeman'
  gem 'letter_opener'
  gem 'listen', '>= 3.0.5', '< 3.2'
  gem 'pry-rails'
  gem 'rspec-rails', '~> 4.0.0.beta3'
  gem 'spring'
  gem 'spring-watcher-listen', '~> 2.0.0'
  gem 'web-console', '>= 3.3.0'
end

group :test do
  gem 'capybara', '>= 2.15'
  gem 'database_cleaner'
  gem 'selenium-webdriver'
  gem 'simplecov'
  gem 'webdrivers'
end

gem 'tzinfo-data', platforms: %i[mingw mswin x64_mingw jruby]
