# frozen_string_literal: true

source 'https://rubygems.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby '2.7.2'

gem 'activeadmin', '~> 2.7.0'
gem 'cloudinary', '~> 1.13.2'
gem 'country_select', '~> 4.0.0'
gem 'devise', '~> 4.7.1'
gem 'devise-security', '~> 0.14.3'
gem 'draper', '~> 4.0.1'

gem 'factory_bot_rails', '~> 6.1'
gem 'ffaker', '~> 2.14.0'
gem 'haml-rails', '~> 2.0.1'
gem 'i18n', '~> 1.8.2'
gem 'image_processing', '~> 1.10.3'
gem 'omniauth-facebook', '~> 6.0.0'
gem 'omniauth-rails_csrf_protection'
gem 'pagy', '~> 3.7.5'
gem 'pg', '~> 1.2.3'
gem 'puma', '>= 4.3.1'
gem 'rails', '~> 6.0.1'
gem 'sass-rails', '>= 6'
gem 'sidekiq', '~> 6.0.6'
gem 'simple_form', '~> 5.0.2'
gem 'turbolinks', '~> 5'
gem 'webpacker', '~> 4.0'
gem 'wicked', '~> 1.3.4'

group :development, :test do
  gem 'brakeman', '~> 5.0'
  gem 'bullet', '~> 6.1'
  gem 'bundler-audit', '~> 0.7.0'
  gem 'bundler-leak', '~> 0.2.0'
  gem 'database_consistency', '~> 0.8', require: false
  gem 'fasterer', '~> 0.8.3'
  gem 'haml_lint', '~> 0.36', require: false
  gem 'lefthook', '~> 0.7'
  gem 'pry-byebug', '~> 3.9'
  gem 'rails-controller-testing', '~> 1.0'
  gem 'reek', '~> 6.0'
  gem 'rspec-rails', '~> 4.0'
  gem 'rubocop', '~> 0.93', require: false
  gem 'rubocop-faker', '~> 1.0', require: false
  gem 'rubocop-performance', '~> 1.9', require: false
  gem 'rubocop-rails', '~> 2.8', require: false
  gem 'rubocop-rspec', '~> 1.44', require: false
end

group :development do
  gem 'i18n-tasks', '~> 0.9'
  gem 'letter_opener', '~> 1.7'
end

group :test do
  gem 'capybara', '~> 3.33'
  gem 'capybara-screenshot', '~> 1.0'
  gem 'database_cleaner', '~> 1.8'
  gem 'pundit-matchers', '~> 1.6'
  gem 'rspec_junit_formatter', '~> 0.4'
  gem 'rspec-sidekiq', '~> 3.1'
  gem 'selenium-webdriver', '~> 3.142'
  gem 'shoulda-matchers', '~> 4.4'
  gem 'simplecov', '~> 0.19', require: false
  gem 'simplecov-lcov', '~> 0.8.0', require: false
  gem 'site_prism', '~> 3.7'
  gem 'test-prof', '~> 0.12'
end
