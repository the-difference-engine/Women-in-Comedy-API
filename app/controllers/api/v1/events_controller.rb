class Api::V1::EventsController < ApplicationController
	def index
		if params[:admin_user] == "true"
			events = Event.all
		else
			events = Event.where(is_private: false)
		end
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
		event = Event.find(params[:id])
		if current_user.admin && event.user_id == current_user
			event.update(
			title: params[:title],
			photo: params[:photo],
			ticket_link: params[:ticket_link],
			about: params[:about],
			time: params[:time],
			date: params[:date],
			address: params[:address],
			location: params[:location],
			is_private: params[:is_private]
			)
			render json: event[:id]
		else
			halt(404)
		end
		render json: event
	end

	def create
		event = Event.create(
			user_id: params[:userId],
			title: params[:title],
			photo: params[:photo],
			ticket_link: params[:ticket_link],
			about: params[:about],
			time: params[:time],
			date: params[:date],
			address: params[:address],
			location: params[:location],
			is_private: params[:is_private]
		)
		render json: event[:id]
	end

	def destroy
		event = Event.find(params[:id])
		event.destroy
	end
end
