class Api::V1::MeetOptionsController < ApplicationController
  def index
    meet_options = MeetOption.all
    render json: meet_options
  end
end
