class Api::V1::SessionsController < ApplicationController
  skip_before_action :verify_authenticity_token

  def create
    user = User.find_by(email: params[:email])
    sign_in(User, user)
    render json: user.as_json(only: %i[id admin email confirmed_at])
    # user = User.find(email: params[:email])
    # if user && user.valid_password?(params[:password])
    #   head(:unauthorized) if user.suspended?
    #   # TODO: Fix this current user assignment
    #   User.current_user = user
    #   # request.env['warden'].set_user(user)
    # end
    # head(:unauthorized)
  end

  def destroy
    # TODO: Is there any cost to just logging out? I suspect log_out is idempotent.
    if User.current_user
      log_out
      # TODO: We gotta stop doing this
      User.current_user = nil
      render json: {
        logout_message: 'Successfully logged out!'
      }
    end
  end
end
