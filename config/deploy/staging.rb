set :domain, "wojtczaks.pl"
set :rails_env, "staging"
set :branch, ENV["BRANCH"] || "master"
set :deploy_to, lambda { "/home/atut_staging/website" }
set :rvm_ruby_string, '1.9.3-p194'
set :repository,  "https://github.com/sabcio/atut.git"
set :user, "atut_staging"

role :app, domain
role :web, domain
role :db,  domain, :primary => true
