class Api::V1::NotificationsController < ApplicationController
  # before_action :authenticate_user!

  def index
    @notifications = Notification.where(recipient: current_user).recent
  end

  def mark_as_read
    @notifications = Notification.where(recipient: current_user).unread
    @notifications.update_all(seen: Time.zone.now)
    render json: {success: true}
  end

  def get_notifications
    # unseen_notifications = Notification.where(notifiable_id: id, seen: nil)
    notifications = Notification.where(notifiable_id: params[:id])

    render json: notifications
  end

  # def create_notification(sender_id, receiver_id, notifiable_type)

  #   sender = User.find_by(id: params[:sender_id])
  #   receiver = User.find_by(id: params[:receiver_id])

  #   Notification.create(
  #     user: sender,
  #     recipient: receiver,
  #     notifiable: receiver,
  #     notifiable_type: params[:notifiable_type]
  #     )
  # end

end
