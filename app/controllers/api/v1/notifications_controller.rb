class Api::V1::NotificationsController < ApplicationController
  # before_action :authenticate_user!
  skip_before_action :verify_authenticity_token

  def index
    @notifications = Notification.where(recipient: current_user).recent
  end

  def mark_all_as_read
    Notification.where(recipient_id: params[:id], seen: nil).update_all(seen: Time.zone.now)

    @notifications = Notification.where(recipient_id: params[:id])
    render 'get_notifications.json.jbuilder'
  end

  def mark_one_as_read
    Notification.where(recipient_id: params[:user_id], id: params[:id], seen: nil).update_all(seen: Time.zone.now)
    @notifications = Notification.where(recipient_id: params[:user_id])
    render 'get_notifications.json.jbuilder'
  end

  def get_notifications
    @notifications = Notification.where(recipient_id: params[:id])
    render 'get_notifications.json.jbuilder'
  end
end
