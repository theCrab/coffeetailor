namespace :deploy do
  desc "Create needed records in the database with its default values"
  task :seed do
    run "bundle exec rake db:seed RAILS_ENV=production"
  end
end