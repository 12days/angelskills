source 'https://rubygems.org'

# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem 'railties'
gem 'rails', '4.0.0'

gem 'omniauth'
gem "omniauth-linkedin"
gem 'linkedin'
gem "nifty-generators", :group => :development
gem 'unicorn'
gem 'cancan'

group :assets do
  gem 'sass-rails', '~> 4.0.0'
  gem 'coffee-rails', '~> 4.0.0'
  gem 'uglifier', '>= 1.3.0'
  gem 'haml-rails'
end

group :development, :test do
  gem 'sqlite3'
  gem 'rspec-rails', '~> 2.0'
  gem 'guard'
  gem 'guard-rspec'
end

group :production do
  gem 'pg', '0.15.1'
  gem 'rails_12factor'
end

gem 'jquery-rails'
gem "database_cleaner", ">= 0.9.1", :group => :test
gem "email_spec", ">= 1.4.0", :group => :test
gem "cucumber-rails", ">= 1.3.0", :group => :test, :require => false
gem "launchy", ">= 2.1.2", :group => :test
gem "capybara", ">= 2.0.2", :group => :test
gem "factory_girl_rails", ">= 4.2.0", :group => [:development, :test]
gem "devise", ">= 2.2.3"
gem "quiet_assets", ">= 1.0.1", :group => :development
gem "figaro", ">= 0.5.3"
gem 'better_errors', '>= 0.7.2', :group => :development
gem "binding_of_caller", ">= 0.6.8", :group => :development
gem 'turbolinks'
gem 'jbuilder', '~> 1.2'
gem "mocha", group: :test
