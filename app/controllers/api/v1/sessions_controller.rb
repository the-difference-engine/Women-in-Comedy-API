class Api::V1::SessionsController < ApplicationController
  skip_before_filter :verify_authenticity_token
  def create
    user = User.where(email: params[:email]).first
    if user && user.valid_password?(params[:password])
      session[:user_id] = user.id
      flash[:user_id] = user.id
      cookies[:user_id] = user.id
      puts "COOKIES: " + cookies[:user_id].to_s
      puts "SESSION USER ID: " + session[:user_id].to_s
      render json: user.as_json(only: [:id, :email, :confirmed_at])
    else
      head(:unauthorized)
    end
  end
end
