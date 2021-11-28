# frozen_string_literal: true

source 'https://rubygems.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby '2.6.6'

gem 'rails', '~> 6.0.4', '>= 6.0.4.1'

gem 'pg', '>= 0.18', '< 2.0'

gem 'puma', '~> 4.1'

gem 'sass-rails', '>= 6'

gem 'webpacker', '~> 4.0'

gem 'turbolinks', '~> 5'

gem 'jbuilder', '~> 2.7'

gem 'bootsnap', '>= 1.4.2', require: false

group :development, :test do
  gem 'byebug', platforms: %i[mri mingw x64_mingw]
  gem 'rspec-rails', '~> 5.0.0'
end

group :development do
  # Access an interactive console on exception pages or by calling 'console' anywhere in the code.
  gem 'listen', '~> 3.2'
  gem 'rubocop', require: false
  gem 'spring'
  gem 'spring-watcher-listen', '~> 2.0.0'
  gem 'web-console', '>= 3.3.0'
  # Spring speeds up development by keeping your application running in the background. Read more: https://github.com/rails/spring
end

# group :test do
#   # Adds support for Capybara system testing and selenium driver
#   # Easy installation and use of web drivers to run system tests with browsers
# end

# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
gem 'tzinfo-data', platforms: %i[mingw mswin x64_mingw jruby]
