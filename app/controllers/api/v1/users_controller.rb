class Api::V1::UsersController < ApplicationController
	# skip_before_action :verify_authenticity_token
	def index
		all_users = User.all
		users = []
		all_users.each do |user|
			user = {firstName: user[:first_name], lastName: user[:last_name], id: user[:id]}
			users.push(user)
		end
		render json: users
	end

	def show
		user = User.find(params[:id])
		render json: {status: 'SUCCESS', message:'Loaded User', data:user}, status: :ok
	end

	def create
		user = User.new(
			email: params[:email],
			password: params[:password],
			first_name: params[:firstName],
			last_name: params[:lastName],
			city: params[:city],
			website: params[:website],
			video_link: params[:video],
			gender: params[:gender],
			training: params[:training],
			experience: params[:experience]
		)
		if (user.save)
			render json: user.as_json(only: [:id, :email])
		end
	end

	def fetch_user_info
		id = request.headers['id'].to_i
		user = User.find_by(id: id)
		user_info = {id: user[:id], firstName: user[:first_name], lastName: user[:last_name], bio: user[:about]}
		render json: user_info
	end

	def fetch_user_feed
		id = request.headers['id'].to_i
		user = User.find_by(id: id)
		# post = user.posts[0]
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
		@user.update(
			first_name: params[:first_name],
			last_name: params[:last_name],
			birthday: params[:birthday],
			about: params[:about],
			avatar: params[:avatar],
			video_link: params[:video_link],
			location: params[:location],
			website: params[:website],
			training: params[:training],
			experience: params[:experience]
		)

		render 'show.json.jbuilder'
	end

	def search
		render 'search.html.erb'
	end

	def destroy
		user = User.find(params[:id])
		user.destroy

		# @users = User.all
		# render 'index.json.jbuilder'

		UsersController.index
		#needs testing
	end


end
