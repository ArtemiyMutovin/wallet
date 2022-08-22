source "https://rubygems.org"
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby "3.0.0"

gem "rails", "~> 7.0.3", ">= 7.0.3.1"


gem "sprockets-rails"

gem "sqlite3", "~> 1.4"

gem "puma", "~> 5.0"

gem "importmap-rails"

gem "turbo-rails"

gem "stimulus-rails"

gem "jbuilder"

gem "redis", "~> 4.0"

# gem "kredis"

# gem "bcrypt", "~> 3.1.7"

gem "tzinfo-data", platforms: %i[ mingw mswin x64_mingw jruby ]

gem "bootsnap", require: false

# gem "sassc-rails"

# gem "image_processing", "~> 1.2"

gem 'rubocop'
gem 'rubocop-performance'
gem 'rubocop-rails'
gem 'rubocop-require_tools', '~> 0.1.2'
gem 'rubocop-rspec'

gem 'devise', '~> 4.0'

group :development, :test do
  gem "debug", platforms: %i[ mri mingw x64_mingw ]
  gem 'factory_bot_rails'
  gem 'rails-controller-testing'
  gem 'rspec-rails', git: 'git@github.com:rspec/rspec-rails.git', branch: '6-0-maintenance'
end

group :development do
  gem "web-console"

  # gem "rack-mini-profiler"

  # gem "spring"

  gem 'letter_opener'
end

group :test do
  gem "capybara"
  gem "selenium-webdriver"
  gem "webdrivers"
end
