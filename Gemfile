source "https://rubygems.org"

ruby "2.3.1"

gem "autoprefixer-rails"
gem "delayed_job_active_record"
gem "flutie"
gem "honeybadger"
gem "jquery-rails"
gem "normalize-rails", "~> 3.0.0"
gem "pg"
gem "puma"
gem "rack-canonical-host"
gem "rails", "~> 5.0.0"
gem "recipient_interceptor"
gem "sass-rails", "~> 5.0"
gem "simple_form"
gem "skylight"
gem "sprockets", ">= 3.0.0"
gem "sprockets-es6"
gem "suspenders"
gem "title"
gem "uglifier"

group :development do
  gem "listen"
  gem "spring"
  gem "spring-commands-rspec"
  gem "web-console"
end

group :development, :test do
  gem "awesome_print"
  gem "bullet"
  gem "bundler-audit", ">= 0.5.0", require: false
  gem "dotenv-rails"
  gem "factory_girl_rails"
  gem "rspec-rails", "~> 3.5.0.beta4"
  gem 'ffaker'
end

group :development, :staging do
  gem "rack-mini-profiler", require: false
end

group :test do
  gem "capybara-webkit"
  gem "database_cleaner"
  gem "formulaic"
  gem "launchy"
  gem "shoulda-matchers"
  gem "simplecov", require: false
  gem "timecop"
  gem "webmock"
  gem 'rails-controller-testing'
end

group :staging, :production do
  gem "rack-timeout"
  gem "rails_stdout_logging"
end

gem 'high_voltage'
gem 'bourbon', '5.0.0.beta.6'
gem 'neat', '~> 1.8.0'
gem 'refills', group: [:development, :test]

gem 'jazz_fingers', group: [:development, :test]
gem 'annotate'
gem 'rubocop', require: false

gem 'paper_trail'
gem 'slim-rails'
gem 'rails-footnotes', '~> 4.0', group: :development
gem 'meta_request', group: :development
gem 'responders'
gem 'brakeman', :require => false, :group => :development

group :test do
  gem 'rspec-instafail', :require => false
  gem 'fuubar'
end

gem "pry-byebug"
gem "pry-rails"
gem 'pry-theme'

gem 'parity'

gem 'devise'
gem 'pundit'
gem 'paperclip'

gem 'country_select'
gem 'rails_best_practices'
gem 'fix-db-schema-conflicts', :group => :development
group :test do
  gem 'pundit-matchers', '~> 1.1.0'
end
