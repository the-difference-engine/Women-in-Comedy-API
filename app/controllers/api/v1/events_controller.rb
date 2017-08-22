class Api::V1::EventsController < ApplicationController
	def index
		@events = Event.all
		render 'index.json.jbuilder'
	end

	def show
		@event = Event.find(params[:id])
		render 'show.json.jbuilder'
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

	def destroy
		event = Event.find(params[:id])
		event.destroy
	end
end
