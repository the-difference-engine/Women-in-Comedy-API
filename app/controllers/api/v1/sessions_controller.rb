class Api::V1::SessionsController < ApplicationController
  skip_before_action :verify_authenticity_token
  def create
    user = User.where(email: params[:email]).first
    if user && user.valid_password?(params[:password])
      User.current_user = user
      env['warden'].set_user(user)
      render json: user.as_json(only: [:id, :admin, :email, :confirmed_at])
    else
      head(:unauthorized)
    end
  end

  def destroy
    if User.current_user
      log_out
      User.current_user = nil
      render json: {logout_message: 'Successfully logged out!'}
    end
  end
end
