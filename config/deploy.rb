$:.unshift(File.expand_path('./lib', ENV['rvm_path'])) # Add RVM's lib directory to the load path.
require "rvm/capistrano"                               # Load RVM's capistrano plugin.

load 'deploy/assets'
require 'bundler/capistrano'

role :web, "50.57.191.65"                              # Your HTTP server, Apache/etc
role :app, "50.57.191.65"                              # This may be the same as your `Web` server
role :db, "50.57.191.65", :primary => true             # This is where Rails migrations will run

set :application, "loja"
set :repository, "git@github.com:victoraweb/loja-marota.git"
set :scm, :git
set :use_sudo, false
set :git_shallow_clone, 1 #only get the last updated release
set :keep_releases, 5 #in repository
set :user, "deployer" #used from capistrano to login
set :deploy_to, "/home/deployer/loja"
set :runner, "deployer"
set :rvm_type, :user
set :rvm_ruby_string, 'ruby-1.9.2@loja'           # Or whatever env you want it to run in.

ssh_options[:paranoid]      = false
ssh_options[:forward_agent] = true
default_run_options[:pty]   = true

namespace :deploy do

  task :start do
    sudo "/etc/init.d/unicorn start"
  end

  task :restart do
    sudo "/etc/init.d/unicorn reload"
  end

  task :stop do
    sudo "/etc/init.d/unicorn stop"
  end

  task :force_restart do
    sudo "/etc/init.d/unicorn restart"
  end

end

namespace :list do
  task :processes do
    run "ps aux"
  end
end

['deploy', 'deploy:cold', 'deploy:migrations'].each do |t|
  after t, "deploy:cleanup" #when more than 5 versions, erase the versions before
end

require './config/boot'