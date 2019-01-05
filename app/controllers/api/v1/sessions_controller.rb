class Api::V1::SessionsController < ApplicationController
  skip_before_action :verify_authenticity_token
  def create
    user = User.where(email: params[:email]).first
    if user && user.valid_password?(params[:password]) 
      User.current_user = user
      request.env['warden'].set_user(user)
      render json: user.as_json(only: [:id, :admin, :superadmin, :email, :confirmed_at])
      if user.suspended?
        head(:unauthorized)
      end
    else
      head(:unauthorized)
    end
  end

  def destroy
    if User.current_user
      User.current_user = nil
    end
    log_out
    render json: {logout_message: "You don't have a user!"}
  end
end
