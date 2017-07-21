class Api::UsersController < ApplicationController

class Api::UsersController < ApplicationController

	def index
		@users = User.all
		render 'index.json.jbuilder'
	end

	def show
		@user = User.find(params[:id])
		render 'show.json.jbuilder'
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

	def destroy
		user = User.find(params[:id])
		user.destroy
	
		# @users = User.all
		# render 'index.json.jbuilder'

		UsersController.index
		#needs testing
	end

end

end
