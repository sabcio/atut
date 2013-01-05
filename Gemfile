source 'https://rubygems.org'

gem 'rails', '3.2.9'
gem 'mysql2'
gem 'jquery-rails'
gem 'therubyracer', :platforms => :ruby

gem 'spree', :github => "spree/spree", :branch => "1-2-stable"
gem 'spree_auth_devise', :git => 'git://github.com/spree/spree_auth_devise'
gem 'spree_recently_viewed', :git => 'git://github.com/spree/spree_recently_viewed.git'
gem 'spree_i18n', :git => 'git://github.com/spree/spree_i18n.git'
gem 'spree_rdr_theme', :git => 'git://github.com/spree/spree_rdr_theme.git'

gem 'rails-i18n'

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


group :test, :development do
  gem 'rspec-rails'
end

group :test do
  gem 'factory_girl_rails'
  gem 'capybara'
  gem 'shoulda-matchers'
  gem 'fakeweb'
  gem 'timecop'
end
