class Api::V1::UsersController < ApplicationController
  # before_action :authenticate_user!, only: [:index]
  skip_before_action :verify_authenticity_token

  # TODO: Reduce ABC score
  def index
    log_in User.current_user
    # TODO: I think Rails has a better way of getting the current user
    current_user = User.current_user
    all_users = []

    if current_user
      # if current  user is admin, return all users
      if current_user.admin
        all_users = User.order(:first_name)
      else
        # If current user is not admin, return non-admin users only
        all_users = User.where(admin: false)
      end
    else
      # TODO: This makes no sense. If no logged in user, return all users, including admins?
      # Behavior is *more* permissive than logged in non-admin user
      all_users = User.all
    end

    users = []

    # TODO: It's been a minute since I did Rails, but there's no way in hell this is how they do serialization.
    all_users.each do |user|
      user = {
        firstName: user[:first_name],
        lastName: user[:last_name],
        admin: user[:admin],
        superadmin: user[:superadmin],
        id: user[:id],
        email: user[:email],
        city: user[:city],
        training: user[:training],
        experience: user[:experience],
        gender: user[:gender]
      }
      users.push(user)
    end
    render json: users
  end

  def show
    user = User.find(params[:id])
    render json: {
      status: 'SUCCESS',
      message: 'Loaded User',
      data: user
    }, status: :ok
  end

  def create
    user = User.new(user_params)
    if user.save
      render json: user.as_json(only: %i[id email])
    end
  end

  # TODO: Reduce ABC score
  def fetch_user_info
    id = request.headers['id'].to_i
    session[:user_id] = id
    user = User.find_by(id: id)

    meeting_options_hash = {}
    user.meet_options.each do |option|
      meeting_options_hash[option.name.to_sym] = true
    end

    # TODO: Ibid.
    user_info = {
      email: user[:email],
      id: user[:id],
      firstName: user[:first_name],
      lastName: user[:last_name],
      admin: user[:admin],
      superadmin: user[:superadmin],
      bio: user[:about],
      photo: user[:photo],
      block_connection_requests: user[:block_connection_requests],
      city: user[:city],
      training: user[:training],
      experience: user[:experience],
      website: user[:website],
      video: user[:video_link],
      meeting_options: meeting_options_hash,
      suspended: user[:suspended]
    }

    render json: user_info
  end

  # TODO: Reduce ABC score
  def fetch_user_feed
    id = request.headers['id'].to_i
    user = User.find_by(id: id)
    users_feed = []
    # TODO: Ibid.
    user.posts.each do |post|
      author = post.author
      feed = {
        postId: post[:id],
        body: post[:body],
        authorId: author[:id],
        authorFirstName: author[:first_name]
      }
      users_feed.push(feed)
    end
    render json: users_feed.reverse
  end

  def update
    @user = User.find(params[:id])
    @user.update(user_params)
    render 'show.json.jbuilder'
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
    user.suspend!('Suspended!')
    user.update(suspended: true)
    render json: user.as_json(only: %i[id suspended])
  end

  def unsuspend
    id = request.headers['id'].to_i
    user = User.find_by(id: id)
    user.unsuspend!
    user.update(suspended: false)
    render json: user.as_json(only: %i[id suspended])
  end

  def admin_mail
    AdminMailer.email_all_users(params[:email], params[:subject]).deliver_now
  end

  private

  def user_params
    params.permit(
      :email,
      :password,
      :first_name,
      :last_name,
      :city,
      :website,
      :video_link,
      :gender,
      :training,
      :experience,
      :admin,
      :photo,
      :birthDate,
      :about,
      :superadmin,
      meet_option_users_attributes: []
    )
  end
end
