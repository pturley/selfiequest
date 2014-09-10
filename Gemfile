source 'https://rubygems.org'

gem 'rails', '~> 4.1.5'
gem 'sass-rails', '~> 4.0.2'
gem 'haml-rails', '~> 0.5.3'
gem 'uglifier', '>= 1.3.0'
gem 'coffee-rails', '~> 4.0.0'
gem 'therubyracer', platforms: :ruby
gem 'jquery-rails'
gem 'turbolinks'
gem 'jbuilder', '~> 1.2'
gem 'librarian-puppet', '~> 1.1.2'
gem 'puppet'
gem 'pg'
gem "paperclip", "~> 4.2"

group :development, :test do
  gem 'sqlite3'
  gem 'rspec-rails', '~> 3.0.2'
  gem 'factory_girl_rails', '~> 4.4.1'
  gem 'pry-rails', '~> 0.3.2'
end

group :staging, :production do
  gem 'newrelic_rpm'
  gem 'rails_12factor'
  gem 'aws-sdk'
end
