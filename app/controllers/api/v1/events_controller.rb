class Api::V1::EventsController < ApplicationController
	def index
		@events = Event.all
		render 'index.json.jbuilder'
	end

	def show
		event = Event.find(params[:id])
		render json: event
	end

	def update
		@event = Event.find(params[:id])
		@event.update(
			host_id: params[:host_id],
			title: params[:title],
			photo: params[:photo],
			date: params[:date],
			ticket_link: params[:ticket_link],
			about: params[:about]
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
