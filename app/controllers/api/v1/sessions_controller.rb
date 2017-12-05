class Api::V1::SessionsController < ApplicationController
  skip_before_filter :verify_authenticity_token
  def create
    user = User.where(email: params[:email]).first
    if user && user.valid_password?(params[:password]) 
      User.current_user = user
      render json: user.as_json(only: [:id, :email, :confirmed_at])
      if user.suspended?
        head(:unauthorized)
      end
    else
      head(:unauthorized)
    end
  end
end
