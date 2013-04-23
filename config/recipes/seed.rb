set_default(:admin_email) { Capistrano::CLI.password_prompt "PostgreSQL Password: " + "\n" }
set_default(:admin_password) { Capistrano::CLI.password_prompt "PostgreSQL Password: " + "\n" }

namespace :deploy do
  desc "Create needed records in the database with its default values"
  task :seed, roles: :db, only: {primary: true} do
    run "cd #{release_path} && RAILS_ENV=#{rails_env} bundle exec rake db:seed", pty: true do |ch, stream, data|
      if data=~/Email\s\[spree\@example.com\]/

      else

      end
    end
  end
  after "deploy:cold", "deploy:seed"
end