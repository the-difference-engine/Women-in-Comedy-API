class Api::V1::SessionsController < ApplicationController
  skip_before_action :verify_authenticity_token
  def create
    user = User.where(email: params[:email]).first
    if user && user.valid_password?(params[:password]) 
      User.current_user = user
      request.env['warden'].set_user(user)
      if user.suspended?
        head(:unauthorized)
      end
      render json: user.as_json(only: [:id, :admin, :superadmin, :email, :confirmed_at])
    else
      head(:unauthorized)
    end
  end

  def destroy
    if User.current_user
      log_out
    end
    User.current_user = nil
    render json: {logout_message: 'Successfully logged out!'}
  end
end
