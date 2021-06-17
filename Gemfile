source 'https://rubygems.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby '2.6.0'

gem 'rails', '~> 6.0.3', '>= 6.0.3.4'

gem 'react_on_rails'
gem "light-service", "~> 0.14.0"
gem 'annotate'
gem "simple_form", "~> 5.0"
gem "pundit", "~> 2.1"
gem "kaminari"
gem "jquery-rails", "~> 4.3"
gem "httparty", "~> 0.17"
gem "bootstrap", "~> 4.4"
gem "pg", "~> 1.2", "< 2.0"
gem "pg_search", "~> 2.3"
gem "responders", "~> 3.0"
gem "sidekiq", "~> 6.0"
gem "cocoon", "~> 1.2"
gem 'redcarpet', "~> 3.5"
gem 'puma', '~> 4.1'
gem 'sass-rails', '>= 6'
gem "webpacker", "~> 4.2"
gem "turbolinks", "~> 5.2"
gem "jbuilder", "~> 2.10"
gem 'bootsnap', '>= 1.4.2', require: false

group :development, :test do
  gem 'byebug', platforms: [:mri, :mingw, :x64_mingw]
  gem "factory_bot_rails", "~> 5.1"
  gem "faker", "~> 2.11"
  gem "pry-byebug", "~> 3.9"
  gem "pry-rails", "~> 0.3"
  gem "parallel_tests", "~> 2.32"
  gem "database_cleaner"
end

group :development do
  gem 'web-console', '>= 3.3.0'
  gem 'listen', '~> 3.2'
  gem 'spring'
  gem 'spring-watcher-listen', '~> 2.0.0'
end

group :test do
  gem 'capybara', '>= 2.15'
  gem 'selenium-webdriver'
  gem 'webdrivers'
end

# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
gem 'tzinfo-data', platforms: [:mingw, :mswin, :x64_mingw, :jruby]
