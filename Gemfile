source 'https://rubygems.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby '2.6.3'

# Custom configuration for: gem 'rails', 
gem "bundler",         ">= 1.3.0"
gem "sprockets-rails", ">= 2.0.0"
gem "activesupport", '~> 6.0.3'
gem "actionpack",    '~> 6.0.3'
gem "actionview",    '~> 6.0.3'
gem "activemodel",   '~> 6.0.3'
gem "activerecord",  '~> 6.0.3'
gem "actionmailer",  '~> 6.0.3'
gem "activejob",     '~> 6.0.3'
gem "actioncable",   '~> 6.0.3'
# gem "activestorage", '~> 6.0.2', '>= 6.0.2.2'
# gem "actionmailbox", '~> 6.0.2', '>= 6.0.2.2'
# gem "actiontext",    '~> 6.0.2', '>= 6.0.2.2'
gem "railties",      '~> 6.0.3'
gem 'puma', '~> 4.1'

# Database
gem 'pg', '>= 0.18', '< 2.0'

# Serialization
gem 'active_model_serializers', '~> 0.10.0'
gem 'fast_jsonapi'

# Integration with ember
gem 'ember-cli-rails'

# Use Active Model has_secure_password
# gem 'bcrypt', '~> 3.1.7'

# Reduces boot times through caching; required in config/boot.rb
gem 'bootsnap', '>= 1.4.2', require: false

group :development do
  # Access an interactive console on exception pages or by calling 'console' anywhere in the code.
  gem 'web-console', '>= 3.3.0'
  gem 'listen', '>= 3.0.5', '< 3.2'
  # Spring speeds up development by keeping your application running in the background. Read more: https://github.com/rails/spring
  gem 'spring'
  gem 'spring-watcher-listen', '~> 2.0.0'
end

gem "activerecord-postgis-adapter", "~> 6.0"
