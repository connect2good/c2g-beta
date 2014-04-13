source 'https://rubygems.org'

# specify ruby version so heroku doesn't
# nag you during a build
ruby '2.1.1'

gem 'rails', '~> 4.0.4'

gem 'carrierwave'
gem 'devise'
gem 'haml-rails'
gem 'hirb'
gem 'jquery-rails'
gem 'js-routes'
gem 'faker', require: false
gem 'fog'
gem 'machinist', require: false
gem 'mini_magick'
gem 'pg'
gem 'pg_search'
gem 'sidekiq'
gem 'will_paginate-foundation', '~> 5.3.3'
gem 'mandrill-api'
gem 'mail_form'
gem 'unf'
gem 'awesome_print'
gem 'money-rails'
gem 'balanced', '~> 1.0.1'


group :production, :staging do
  gem 'rails_12factor'
end

group :assets do
  gem 'coffee-rails', '~> 4.0'
  gem 'html5shiv-rails'
  gem 'jquery-ui-rails'
  gem 'sass-rails',   '~> 4.0'
  gem 'uglifier', '>= 1.0.3'
  gem 'foundation-rails', '~> 5.2.2.0'
end

group :development do
  gem 'better_errors'
  gem 'binding_of_caller'
  gem 'foreman',      require: false
  gem 'guard-bundler'
  gem 'guard-cucumber'
  gem 'guard-rails'
  gem 'guard-rspec'
  gem 'guard-sidekiq'
  gem 'html2haml'
  gem 'quiet_assets'
  gem 'terminal-notifier-guard', require: RUBY_PLATFORM.include?('darwin') && 'terminal-notifier-guard'
  gem 'pry'
end

group :development, :test do
  gem 'rspec-rails'
end

group :test do
  gem 'capybara'
  gem 'cucumber'
  gem 'cucumber-rails', require: false
  gem 'database_cleaner'
  gem 'email_spec'
  gem 'launchy'
  gem 'selenium-webdriver'
  gem 'timecop'
end
