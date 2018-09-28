class Api::V1::GuestsController < ApplicationController
  def create
    guest = Guest.new(
      event_id: params[:eventId],
      user_id: params[:userId],
      first_name: params[:firstName],
      last_name: params[:lastName]
    )
    # TODO: This needs some error handling
    guest.save
  end

  def destroy
    guest = Guest.find_by(id: params[:id])
    guest.destroy
  end
end
