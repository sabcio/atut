require 'bundler/capistrano'
require 'capistrano/ext/multistage'
require 'rvm/capistrano'

set :application, 'atut'
set :stages, %w(production staging)
set :default_stage, :staging
set :server_hostname, 'wojtczaks.pl'

set :rvm_type, :system

set :scm_passphrase,  Proc.new { Capistrano::CLI.password_prompt('Git Password: ') }

set :keep_releases, 5

default_run_options[:pty] = true
set :scm, "git"

ssh_options[:forward_agent] = true
set :deploy_via, :remote_cache
set :git_shallow_clone, 1
set :git_enable_submodules, 1
set :use_sudo, false

namespace :deploy do
  task :symlink_shared do
    run "ln -nfs #{shared_path}/database.yml #{latest_release}/config/database.yml"
    run "ln -nfs #{shared_path}/thin.yml #{latest_release}/thin.yml"
    run "ln -nfs #{shared_path}/setup_mail.rb #{latest_release}/config/initializers/setup_mail.rb"
    run "ln -nfs #{shared_path}/assets #{latest_release}/public/assets"
    run "ln -nfs #{shared_path}/spree #{latest_release}/public/spree"
  end
end

after 'deploy:update_code', 'deploy:symlink_shared'
before 'thin:restart', 'assets:precompile'

# Override the restart task to do something better
deploy.task :restart, :roles => :app do
  migrate

  thin.restart

  sleep 3
end

# When stopping the application
deploy.task :stop, :roles => :app do
  deploy.web.disable
  thin.stop
end

namespace :assets do
  desc "Compile assets"
  task :precompile, :roles => :app do
    run "cd #{current_path}; bundle exec rake assets:precompile;"
  end
end

# Thin tasks
namespace :thin do
  desc "Restart thin"
  task :restart, :roles => :app do
    stop
    start
  end

  desc "Stop thin"
  task :stop, :roles => :app do
    run "cd #{current_path}; bundle exec thin stop -C thin.yml;"
  end

  desc "Start thin"
  task :start, :roles => :app do
    run "cd #{current_path};  bundle exec thin start -C thin.yml;"
  end
end
