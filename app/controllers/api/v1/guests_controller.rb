class Api::V1::GuestsController < ApplicationController
  def create
    guest = Guest.new(
      event_id: params[:eventId],
      user_id: params[:userId],
      first_name: params[:firstName],
      last_name: params[:lastName]
    )
    if(guest.save)

    end
  end

  def destroy
    quest = Guest.find_by(id: params[:id])
    quest.destroy
  end
end
