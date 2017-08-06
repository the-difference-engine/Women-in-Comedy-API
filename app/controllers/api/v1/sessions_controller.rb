class Api::V1::SessionsController < ApplicationController
  def create
    user = User.where(email: params[:email]).first
    if user && user.valid_password?(params[:password])
      render json: user.as_json(only: [:id, :email, :authentication_token])
    else
      head(:unauthorized)
    end
  end

  
end
