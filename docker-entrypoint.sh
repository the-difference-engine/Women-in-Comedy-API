#!/bin/bash

set -e

until psql postgres://postgres:password@db -c '\q'; do
  >&2 echo "Postgres is unavailable - sleeping"
  sleep 1
done

>&2 echo "Postgres is up!"

bundle install --jobs=4
rake db:drop && rake db:create && rake db:schema:load && rake db:seed
bin/rails db:environment:set RAILS_ENV=development
rails server -b 0.0.0.0 -p 9000
