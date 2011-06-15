source "http://rubygems.org"
gem "rails", "3.0.8"
gem 'acl9'
gem 'kaminari'
gem 'haml-rails'
gem 'jquery-rails'
gem 'tabs_on_rails'
gem 'date_validator'

group :test do
  gem 'factory_girl_rails'
  gem "capybara", ">= 0.4.0"
  gem 'turn'
  gem 'mocha', :require => false
end

platforms :ruby do
  group :test, :development do
    gem 'sqlite3-ruby', :require => 'sqlite'
  end
end

platforms :jruby do
  gem 'activerecord-jdbc-adapter'
  gem 'jruby-openssl'
  gem 'trinidad'
  gem 'ffi-ncurses'

  group :test, :development do
    gem 'jdbc-sqlite3'
  end
end
