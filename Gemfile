source 'https://rubygems.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby '3.0.1'

gem 'rails', '~> 6.0.3', '>= 6.0.3.4'

gem 'react_on_rails'
gem "light-service"
gem 'annotate'
gem "simple_form"
gem "pundit"
gem "kaminari"
gem "attr_encrypted"
gem "jquery-rails"
gem "httparty"
gem "bootstrap"
gem "pg"
gem "pg_search"
gem "shakapacker", "6.5.1"
gem "responders"
gem "sidekiq"
gem "cocoon"
gem 'redcarpet'
gem 'puma'
gem 'sass-rails'
gem "webpacker"
gem "turbolinks"
gem "jbuilder"
gem 'bootsnap', require: false
gem "foreman"

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

gem 'mini_racer', platforms: :ruby