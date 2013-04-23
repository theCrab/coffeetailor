namespace :deploy do
  desc "Create needed records in the database with its default values"
  task :seed, roles: :db, only: {primary: true} do
    run "cd {release_path}; bundle exec rake db:seed RAILS_ENV=#{rails_env}"
  end
end