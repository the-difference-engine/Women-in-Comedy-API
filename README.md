# WOMEN IN COMEDY

The API is a Rails app running on Heroku.

## Dependencies

* Postgresql (10)
* Redis
* Ruby (2.4.4)

## Running Locally

With Postgres running, gems installed, and the DB setup (as described in
[Setup](#setup), run:

```sh
rails server -p 9000
```

## Setup

### Mac

1. If necessary, [install Homebrew](https://brew.sh/).

2. Install a Ruby version management tool. Some options include `rbenv`, `rvm`,
and `ruby-install/chruby`. This guide assumes use of rvm:
```sh
brew install rvm
```

3. Use your Ruby management tool to install the Ruby version used by this
project:
```sh
rvm install 2.4.4
```

4. Install postgres:
```sh
brew install postgresql
```

If you already have postgres installed, make sure you're running version 10 by
upgrading:
```sh
brew upgrade postgresql
brew postgresql-upgrade-database
```

5. Start your database server:
```sh
brew services start postgresql
```

6. Clone this repo if you don't already have it:
```sh
git clone https://github.com/the-difference-engine/Women-in-Comedy-API.git
cd Women-in-Comedy-API
```

8. Bundler is a Ruby package manager, like npm. You'll need to install it:
```
gem install bundler
```

9. Bundler will use the Gemfile and Gemfile.lock to install the package versions
you need:
```sh
bundle install
```

If you run into problems installing the `pg` gem here, make sure to disable
real-time protection in your anti-virus program. In the future, you may need to
run `bundle install` again after `git pull`ing to install new and updated
dependencies.

10. Rake is a Ruby tool that allows you to execute pre-defined tasks. Here,
we'll use it to create database tables and store some test data:
```sh
rake db:setup
```

### Windows/Linux

TBD

## Testing

To run all tests:
```sh
rake spec
```

## Deployment

TBD

## Architecture

TBD
