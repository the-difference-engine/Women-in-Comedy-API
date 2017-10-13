class Api::V1::EventsController < ApplicationController
	def index
		events = Event.all
		render json: events
	end

	def show
		event = Event.find_by(id: params[:id])
		guests = event.guests
		posts = []
		event.posts.each do |post|
			author = post.author
			event_post = { postId: post[:id], body: post[:body], authorId: author[:id], authorFirstName: author[:first_name] }
			posts.push(event_post)
		end
		event = {info: event, guests: guests, posts: posts.reverse}
		render json: event
	end

	def my_events
		events = Event.where(user_id: params[:user_id])
		render json: events
	end

	def update
		@event = Event.find(params[:id])
		@event.update(
			title: params[:title],
			photo: params[:img],
			ticket_link: params[:ticketLink],
			about: params[:description],
			time: params[:time],
			date: params[:date],
			address: params[:address],
			location: params[:location]
		)
		render 'show.json.jbuilder'
	end

	def create
		event = Event.create(
			user_id: params[:userId],
			title: params[:title],
			photo: params[:img],
			ticket_link: params[:ticketLink],
			about: params[:description],
			time: params[:time],
			date: params[:date],
			address: params[:address],
			location: params[:location]
		)
		render json: event[:id]
	end

	def destroy
		event = Event.find(params[:id])
		event.destroy
	end
end
