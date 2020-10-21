# frozen_string_literal: true

source('https://rubygems.org')
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby('2.6.3')

# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem('rails', '~> 6.0.3', '>= 6.0.3.2')
# Use mysql as the database for Active Record
gem('mysql2', '>= 0.4.4')
# Use Puma as the app server
gem('puma', '~> 4.1')
# Use SCSS for stylesheets
gem('sass-rails', '>= 6')
# Transpile app-like JavaScript. Read more: https://github.com/rails/webpacker
gem('webpacker', '~> 4.0')
# Turbolinks makes navigating your web application faster. Read more: https://github.com/turbolinks/turbolinks
gem('turbolinks', '~> 5')
# Build JSON APIs with ease. Read more: https://github.com/rails/jbuilder
gem('jbuilder', '~> 2.7')
# Use Redis adapter to run Action Cable in production
# gem 'redis', '~> 4.0'
# Use Active Model has_secure_password
# gem 'bcrypt', '~> 3.1.7'

# Use Active Storage variant
# gem 'image_processing', '~> 1.2'

# Reduces boot times through caching; required in config/boot.rb
gem('bootsnap', '>= 1.4.2', require: false)

# Devise is a flexible authentication solution for Rails based on Warden.
gem('devise')

group :development, :test do
  # Call 'byebug' anywhere in the code to stop execution and get a debugger console
  gem('byebug', platforms: %i[mri mingw x64_mingw])
  # rspec-rails brings the RSpec testing framework to Ruby on Rails
  gem('rspec-rails', '~> 4.0.1')
  # factory_bot is a fixtures replacement with a straightforward definition syntax
  gem('factory_bot_rails')
  # A library for generating fake data such as names, addresses, and phone numbers.
  gem('faker', '~> 2.1', '>= 2.1.2')
  # Simple one-liner tests for common Rails functionality https://matchers.shoulda.io
  gem('shoulda-matchers')
  # Automatic Ruby code style checking tool.
  gem('rubocop', '~> 0.72.0')
end

group :development do
  # Access an interactive console on exception pages or by calling 'console' anywhere in the code.
  gem('listen', '~> 3.2')
  # Web Console is a debugging tool for your Ruby on Rails applications.
  gem('web-console', '>= 3.3.0')
  # Spring speeds up development by keeping your application running in the background. Read more: https://github.com/rails/spring
  gem('spring')
  # Makes spring watch files using the listen gem.
  gem('spring-watcher-listen', '~> 2.0.0')
end

group :test do
  # Adds support for Capybara system testing and selenium driver
  gem('capybara', '>= 2.15')
  # WebDriver is a tool for writing automated tests of websites.
  gem('selenium-webdriver')
  # Easy installation and use of web drivers to run system tests with browsers
  gem('webdrivers')
end

# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
gem('tzinfo-data', platforms: %i[mingw mswin x64_mingw jruby])
