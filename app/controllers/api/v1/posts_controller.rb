class Api::V1::PostsController < ApplicationController

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

	def create
		post = Post.create(
			body: params[:body],
			postable_id: params[:userId],
			postable_type: 'User',
			author_id: params[:authorId]
		)
		render json: post
	end

	def event_post
		post = Post.create(
			body: params[:body],
			postable_id: params[:eventId],
			postable_type: 'Event',
			author_id: params[:authorId]
		)
	end

end
