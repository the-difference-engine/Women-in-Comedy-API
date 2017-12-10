class ApplicationController < ActionController::Base
    protect_from_forgery with: :exception
    include Api::V1::SessionsHelper

  end
