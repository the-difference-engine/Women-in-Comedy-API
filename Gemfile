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

# activerecord 
gem 'ransack'

# Use Redis adapter to run Action Cable in production
gem 'redis', '~> 3.0'

# Use ActiveModel has_secure_password
# gem 'bcrypt', '~> 3.1.7'

# Use Devise & Omniauth for user authentication
gem 'devise'
gem 'devise_suspendable'
gem 'omniauth'
gem 'omniauth-facebook'

# Use rails_12factor to comply with Heroku deply guidelines
gem 'rails_12factor'

# Use dotenv-rails to store environment vars in a dotfile
gem 'dotenv-rails'

# Use rack-cors to do avoid CORS errors in local development
gem 'rack-cors'

# Use cancancan to manage user authorization
gem 'cancancan', '~> 2.0'

# Use nio4r to help ActionCable function
gem 'nio4r', '~> 2.2'

# Use sendgrid-ruby to integrate with Sendgrid to send emails
gem 'sendgrid-ruby'   

# Use mail_form to send emails from forms without needing to define endpoints
gem 'mail_form'

gem 'bootsnap'

# Use Capistrano for deployment
# gem 'capistrano-rails', group: :development
group :development, :test do
  # Call 'byebug' anywhere in the code to stop execution and get a debugger console
  gem 'byebug', platform: :mri
  gem 'rspec-rails'
  gem 'bullet'
end

group :development do
  # Access an IRB console on exception pages or by using <%= console %> anywhere in the code.
  gem 'web-console', '>= 3.3.0'
  gem 'listen', '~> 3.0.5'
  # ERD generates a visualization of the database associations
  # See https://voormedia.github.io/rails-erd/install.html for further installation and visualization generation instructions - super easy!
  gem 'rails-erd'
  gem 'pry-rails'
end

# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
gem 'tzinfo-data', platforms: [:mingw, :mswin, :x64_mingw, :jruby]

gem "cloudinary", "~> 1.11"
