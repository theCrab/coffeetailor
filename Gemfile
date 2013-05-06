source 'https://rubygems.org'

ruby '1.9.3'
gem 'rails', '3.2.13'


group :development, :test do
	gem 'rspec-rails'
  gem 'sqlite3'
  gem 'pry'
end

# For a better development experience
# NOTE: always ensure better_errors is above meta_request
group :development do
  gem 'better_errors'
  gem 'binding_of_caller'
  gem 'meta_request'
end

# Bundle edge Rails instead:
# gem 'rails', :git => 'git://github.com/rails/rails.git'
  gem 'pg'

# Gems used only for assets and not required
# in production environments by default.
group :assets do
  gem 'sass-rails',   '~> 3.2.3'
  gem 'coffee-rails', '~> 3.2.1'

  # See https://github.com/sstephenson/execjs#readme for more supported runtimes
  # gem 'therubyracer', :platforms => :ruby

  gem 'uglifier', '>= 1.0.3'
end

gem 'jquery-rails'

# To use ActiveModel has_secure_password
# gem 'bcrypt-ruby', '~> 3.0.0'

# To use Jbuilder templates for JSON
# gem 'jbuilder'
# gem 'aws-sdk'
# Use unicorn as the app server
gem 'thin'

# Deploy with Capistrano
# gem 'capistrano'
# gem 'cap_bootstrap'

# To use debugger
# gem 'debugger'
gem 'ransack', '0.7.2'
# gem 'gocardless'

gem 'spree', '~> 1.3.2'
gem 'spree_auth_devise', :github => 'spree/spree_auth_devise', :branch => '1-3-stable'

gem 'spree_subscriptions', :git => "https://github.com/nebulab/spree-subscriptions.git"
gem 'spree_static_content', :git => 'git://github.com/spree/spree_static_content', :branch => "1-3-stable"
gem 'spree_variant_options', :git => "https://github.com/theCrab/spree_variant_options.git", :branch => 'master'
gem 'spree_gocardless', :git => 'git://github.com/theCrab/spree_gocardless'
