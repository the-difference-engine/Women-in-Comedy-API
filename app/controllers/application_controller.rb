class ApplicationController < ActionController::Base
  include Api::V1::SessionsHelper
  protect_from_forgery with: :null_session
end
