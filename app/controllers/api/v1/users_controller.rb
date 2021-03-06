require 'cloudinary'

class Api::V1::UsersController < ApplicationController
  # before_action :authenticate_user!, only: [:index]
  skip_before_action :verify_authenticity_token

  def index
    # get current user logged in
    log_in User.current_user
    current_user = User.current_user
    all_users = []

    if current_user
      if current_user.admin
        all_users = User.order(:first_name)
      else
        all_users = User.where.not(id: UserBlock.blocked_users(current_user.id).pluck(:blocked_id) + UserBlock.blocker_users(current_user.id).pluck(:blocker_id) + [current_user.id])
      end
    end

    users = []

    all_users.each do |user|
      user = {
        firstName: user[:first_name],
        lastName: user[:last_name],
        admin: user[:admin],
        superadmin:user[:superadmin],
        id: user[:id],
        email: user[:email],
        city: user[:city],
        training: user[:training],
        experience: user[:experience],
			  gender: user[:gender],
        public_figure: user[:public_figure],
        is_mentor: user[:is_mentor]
      }
      users.push(user)
    end
    render json: users
  end

  def show
    user = User.find(params[:id])
    render json: {status: 'SUCCESS', message: 'Loaded User', data: user}, status: :ok
  end

  def create
    user = User.new(user_params)
    if user.save
      render json: user.as_json(only: [:id, :email])
    end
  end

  def fetch_user_info
    id = request.headers['id'].to_i
    session[:user_id] = id
    user = User.find_by(id: id)

    meeting_options_hash = {}
    if user
      user.meet_options.each do |option|
        meeting_options_hash[option.name.to_sym] = true;
      end
  
      render json: serialize_user(user)
    else
      render json: {}, status: 401
    end
  end

  def fetch_user_feed
    id = request.headers['id'].to_i
    user = User.find_by(id: id)
    users_feed = []
    user.posts.each do |post|
      author = post.author
      feed = {postId: post[:id], body: post[:body], authorId: author[:id], authorFirstName: author[:first_name]}
      users_feed.push(feed)
    end
    render json: users_feed.reverse
  end

  def update
    @user = User.find(params[:id])
    @user.update(user_params)

    render 'show.json.jbuilder'
  end

  def upload_profile_photo
    head(:forbidden) unless params[:id] == req.headers['id'].to_i
    head(:bad_request) unless ["image/jpeg", "image/gif", "image/png"].include?(@content_type)

    user = User.find(params[:id])
    upload = Cloudinary::Uploader.upload(@tempfile,
      :folder => "profile_photos", :public_id => user.id, :overwrite => true,
      :resource_type => "image")
    head(:bad_gateway) unless upload
    
    user.update(profile_pic_url: upload.secure_url)
    render json: serialize_user(user)
  end

  def block_connection_requests
    @user = User.find(params[:id])
    @user.update(block_connection_requests: !@user.block_connection_requests)
    @user.save
  end

  def destroy
    user = User.find(params[:id])
    user.delete
  end

  def resend_confirmation_instructions
		user = User.where(email: params[:email]).first
		if user
			user.send_confirmation_instructions
		else
			head(:unauthorized)
		end
	end

  def suspend
    id = request.headers['id'].to_i
    user = User.find_by(id: id)
    user.suspend!("Suspended!")
    user.update(suspended: true)
    render json: user.as_json(only: [:id, :suspended])
  end

  def unsuspend
    id = request.headers['id'].to_i
    user = User.find_by(id: id)
    user.unsuspend!
    user.update(suspended: false)
    render json: user.as_json(only: [:id, :suspended])
  end

  def admin_mail
    AdminMailer.email_all_users(params[:email], params[:subject]).deliver_now
  end

  private

  def serialize_user(user)
    return {
      email: user[:email],
      id: user[:id],
      firstName: user[:first_name],
      lastName: user[:last_name],
      admin: user[:admin], 
      superadmin: user[:superadmin], 
      public_figure: user[:public_figure], 
      is_mentor: user[:is_mentor], 
      bio: user[:about], 
      photo: user[:photo], 
      block_connection_requests: user[:block_connection_requests],
      city: user[:city],
      training: user[:training],
      experience: user[:experience],
      website: user[:website],
      video: user[:video_link],
      meeting_options: user[:meeting_options_hash],
      suspended: user[:suspended]
    }
  end

  def user_params
    params.permit(:email, :password, :first_name, :last_name, :city, :website, :video_link, :gender, :training, :experience, :admin, :photo, :birthDate, :about, :superadmin, :public_figure, :is_mentor, meet_option_users_attributes: [])
  end
end
