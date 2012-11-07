source 'https://rubygems.org'

gem 'rails', '3.2.8'
gem 'mysql2'
gem 'jquery-rails'
gem 'spree', '1.2.0'
gem 'spree_auth_devise', :git => 'git://github.com/spree/spree_auth_devise'
gem 'therubyracer', :platforms => :ruby
gem 'spree_i18n', :git => 'git://github.com/spree/spree_i18n.git'

group :assets do
  gem 'sass-rails',   '~> 3.2.3'
  gem 'coffee-rails', '~> 3.2.1'
  # gem 'therubyracer', :platforms => :ruby
  gem 'uglifier', '>= 1.0.3'
end

group :staging, :production do
  gem 'thin'
end

group :development do
  gem 'rvm-capistrano'
  gem 'capistrano'
  gem 'capistrano-ext'
end
