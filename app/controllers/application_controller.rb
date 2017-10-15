class ApplicationController < ActionController::Base
    protect_from_forgery with: :exception
    def current_user
      @current_user ||= User.find_by(id: session[:user_id]) if session[:user_id]
      puts "CURRENT USER IS : " + session[:user_id].to_s
    end
    helper_method :current_user

  end
