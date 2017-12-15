class Api::V1::UsersController < ApplicationController
	# before_action :authenticate_user!, only: [:index]

	def index
		# # Get current user logged in
		# log_user  = User.current_user
		# log_in log_user
		log_in User.current_user
		all_users = []

		if current_user
			#if current loggin user is admin, return all users
			if current_user.admin
				all_users = User.all
			else
			# If current user is not admin, return non-admin users only
				all_users = User.where(admin: false)
			end
		else
			all_users = User.all
		end

		users = []

		all_users.each do |user|
			user = {firstName: user[:first_name],
				lastName: user[:last_name],
				id: user[:id],
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
			experience: params[:experience],
			admin: false,
			photo: "https://image.freepik.com/free-icon/female-student-silhouette_318-62252.jpg"
		)

		#Add meeting options for user
		MeetOption.all.each do | option |
			if params[option.name.to_sym]
				user.meet_options << option
			end
		end

		if user.save
			render json: user.as_json(only: [:id, :email])
		end
	end

	def fetch_user_info
		id = request.headers['id'].to_i
		session[:user_id] = id
		user = User.find_by(id: id)
		
		meeting_options_hash = {}
		user.meet_options.each do |option|
			meeting_options_hash[option.name.to_sym] = true;
		end

		user_info = {id: user[:id], firstName: user[:first_name], lastName: user[:last_name], admin: user[:admin], bio: user[:about], photo: user[:photo], block_connection_requests: user[:block_connection_requests],
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
			first_name: params[:firstName],
			last_name: params[:lastName],
			birthdate: params[:birthdate],
			about: params[:bio],
			video_link: params[:video],
			city: params[:city],
			website: params[:website],
			training: params[:training],
			experience: params[:experience],
			admin: params[:admin],
			photo: "https://image.freepik.com/free-icon/female-student-silhouette_318-62252.jpg"
		)

		#Add meeting options for user
		MeetOption.all.each do | option |
				if params[option.name.to_sym] == true
					@user.meet_options << option
				#Delete the meeting options that user uncheck in the edit form
				else
					@user.meet_options.delete(option);
				end
	  end

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

		# @users = User.all
		# render 'index.json.jbuilder'

		# UsersController.index
		#needs testing
	end


	def suspend
			id = request.headers['id'].to_i
			user = User.find_by(id: id)
			user.suspend!("Suspended!")
			user.update(suspended: true)
			render json: user.as_json(only: [:id, :suspended])		
	end

	def unsuspend
		# if current_user
		id = request.headers['id'].to_i
		user = User.find_by(id: id)
		user.unsuspend!
		user.update(suspended: false)
		render json: user.as_json(only: [:id, :suspended])
		# end
		end

end
