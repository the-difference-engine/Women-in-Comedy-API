# This file is used by Rack-based servers to start the application.

require_relative 'config/environment'

run Rails.application

config.action_cable.allowed_request_origins = ['http://localhost:3000']
