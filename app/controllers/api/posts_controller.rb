class Api::PostsController < ApplicationController

	def index
		@posts = Post.all

		render 'index.json.jbuilder'
	end

	def show
		@post = Post.find(params[:id])

		render 'show.json.jbuilder'
	end

	def update
		@post = Post.find(params[:id])
		
		@post.update(
			# host_id: params[:host_id],
			# title: params[:title],
			# photo: params[:photo],
			# date: params[:date],
			# ticket_link: params[:ticket_link],
			# about: params[:about]
		)

		render 'show.json.jbuilder'
	end

	def destroy
		post = Post.find(params[:id])
		post.destroy
	end

end
