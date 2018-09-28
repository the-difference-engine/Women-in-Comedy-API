source 'https://rubygems.org'

git_source(:github) do |repo_name|
  repo_name = "#{repo_name}/#{repo_name}" unless repo_name.include?('/')
  "https://github.com/#{repo_name}.git"
end

ruby '2.5.0'

# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem 'rails', '5.2.0'

# Use pg as the database for Active Record
gem 'pg'

# Use Puma as the app server
gem 'puma', '~> 3.0'

# Use SCSS for stylesheets
gem 'sass-rails', '~> 5.0'

# Use Uglifier as compressor for JavaScript assets
gem 'uglifier', '>= 1.3.0'

# Use CoffeeScript for .coffee assets and views
gem 'coffee-rails', '~> 4.2'

# Use jquery as the JavaScript library
gem 'jquery-rails'

# Turbolinks makes navigating your web application faster. Read more: https://github.com/turbolinks/turbolinks
gem 'turbolinks', '~> 5'

# Build JSON APIs with ease. Read more: https://github.com/rails/jbuilder
gem 'jbuilder', '~> 2.5'

# Use Redis adapter to run Action Cable in production
gem 'redis', '~> 3.0'

# TODO: Figure out whether or not we should be using this
# Use ActiveModel has_secure_password
# gem 'bcrypt', '~> 3.1.7'

# Use Devise to manage user authentication and authorization
gem 'devise'
gem 'devise_suspendable'

# Depliy app with 12 factor best practices
gem 'rails_12factor'

# Allow users to log in with social media accounts
gem 'omniauth'
gem 'omniauth-facebook'

# Manage environment variables with dotfiles
gem 'dotenv-rails'

# Avoid CORS issues with this Rack middleware
gem 'rack-cors'

# TODO: establish what this does
gem 'cancancan', '~> 2.0'

# TODO: establish what this does
gem 'nio4r', '~> 2.2'

# TODO: establish what this does
gem 'mail_form'

# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
gem 'tzinfo-data', platforms: %i[mingw mswin x64_mingw jruby]

group :development, :test do
  gem 'bullet'
  # Call 'byebug' anywhere in the code to stop execution and get a debugger console
  gem 'byebug', platform: :mri
  gem 'rspec-rails'
end

group :development do
  gem 'listen', '~> 3.0.5'
  gem 'pry-rails'
  # ERD generates a visualization of the database associations (https://voormedia.github.io/rails-erd/install.html)
  gem 'rails-erd'
  # Access an IRB console on exception pages or by using <%= console %> anywhere in the code.
  gem 'web-console', '>= 3.3.0'
end
