namespace :deploy do
  desc "Create needed records in the database with its default values"
  task :seed do
    run "cd {current_path}; bundle exec rake db:seed RAILS_ENV=production"
  end
end