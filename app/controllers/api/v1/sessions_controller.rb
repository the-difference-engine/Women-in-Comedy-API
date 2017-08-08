class Api::V1::SessionsController < ApplicationController
  skip_before_action :verify_authenticity_token
  def create
    user = User.where(email: params[:email]).first
    if user && user.valid_password?(params[:password])
      render json: user.as_json(only: [:id, :email])
    else
      head(:unauthorized)
    end
  end


end
