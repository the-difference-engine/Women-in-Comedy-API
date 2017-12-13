class Users::SessionsController < Devise::SessionsController
  # before_action :configure_sign_in_params, only: [:create]
  # skip_before_action :verify_authenticity_token

  # GET /resource/sign_in
  # def new
  #   super
  # end

  # POST /resource/sign_in
  # def create
  #   user = User.where(email: params[:email]).first
  #   if user && user.valid_password?(params[:password])
  #     sign_in(user)
  #     puts "CURRENT USER HAHAHHAA"
  #     puts current_user
  #     render json: user.as_json(only: [:id, :admin, :email, :confirmed_at])
  #   else
  #     head(:unauthorized)
  #   end
  # end
  # DELETE /resource/sign_out
  # def destroy
  #   super
  # end

  # protected

  # If you have extra params to permit, append them to the sanitizer.
  # def configure_sign_in_params
  #   devise_parameter_sanitizer.permit(:sign_in, keys: [:attribute])
  # end
end
