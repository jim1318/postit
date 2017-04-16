source 'https://rubygems.org'

ruby '2.1.1'  #switch to 2.1.10 for Heroku
gem 'rails', '4.0.0'      
gem 'sass-rails', '~> 4.0.0'
gem 'uglifier' , '>= 1.3.0'
gem 'coffee-rails', '~> 4.0.0'
gem 'bootstrap-sass', '~> 2.3.2.0'
gem 'voteable_jimfinn', '0.0.2', path: '/Users/JimFinn/rails_apps/voteable-gem'


# See https://github.com/sstephenson/execjs#readme for more supported runtimes
# gem 'therubyracer', platforms: :ruby

gem 'jquery-rails'
gem 'turbolinks'
gem 'jbuilder', '~> 1.2'
gem 'bcrypt-ruby', '~> 3.0.0'

group :doc do
  gem 'sdoc', require: false    #http://stackoverflow.com/questions/34469246/bcrypt-loading-error-in-windows-10
end

group :development do
  gem 'quiet_assets'
  gem 'pry'
  gem 'sqlite3'
end

group :production do
  gem 'pg'
  gem 'rails_12factor'
end
