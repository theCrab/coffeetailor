require "bundler/capistrano"

load 'config/recipes/base'
load 'config/recipes/check'
load 'config/recipes/nodejs'
load 'config/recipes/postgresql'
load 'config/recipes/rbenv'
load 'config/recipes/nginx'
load 'config/recipes/unicorn'
load 'config/recipes/utilities'
load 'config/recipes/security'

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

def press_enter(ch, stream, data)
  if data =~ /Press.\[ENTER\].to.continue/
    # prompt, and then send the response to the remote process
    ch.send_data("\n")
  else
    # use the default handler for all other text
    Capistrano::Configuration.default_io_proc.call(ch, stream, data)
  end
end

after "deploy", "deploy:cleanup" # keep only the last 5 releases