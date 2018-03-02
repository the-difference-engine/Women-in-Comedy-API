class Api::V1::MeetOptionsController < ApplicationController
  def index
    meetOptions = MeetOption.all
    render json: meetOptions
  end
end