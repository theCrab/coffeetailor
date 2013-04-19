require "bundler/capistrano"

load 'config/recipes/base'
load 'config/recipes/nginx'
load 'config/recipes/nodejs'
load 'config/recipes/unicorn'
load 'config/recipes/postgresql'
load 'config/recipes/security'
load 'config/recipes/rbenv'
load 'config/recipes/utilities'
load 'config/recipes/check'

server "91.109.5.59", :web, :app, :db, primary: true

set :user, "deployer"
set :application, "coffeetailor"
set :domain, "#{application}.co.uk"
set :deploy_to, "/home/#{user}/apps/#{application}"
set :deploy_via, :remote_cache
set :use_sudo, false
set :scm, "git"
set :repository, "git@github.com:theCrab/#{application}.git"
set :branch, "master"
set :port, "3322"

default_run_options[:pty] = true
ssh_options[:forward_agent] = true

after "deploy", "deploy:cleanup" # keep only the last 5 releases