class Api::V1::NotificationsController < ApplicationController
  # before_action :authenticate_user!

  def index
    @notifications = Notification.where(recipient: current_user).recent
  end

  def mark_all_as_read
    Rails.logger.info "Inside mark_all_as_read"
    Notification.where(recipient_id: params[:id], seen: nil).update_all(seen: Time.zone.now)

    @notifications = Notification.where(recipient_id: params[:id])
    render 'get_notifications.json.jbuilder'
  end

  def mark_as_read
    # byebug
    Notification.where(id: params[:notification_id], recipient_id: params[:id], seen: nil).update(seen: Time.zone.now)

    @notifications = Notification.where(recipient_id: params[:id])

    render 'get_notifications.json.jbuilder'
  end

  def get_notifications
    # unseen_notifications = Notification.where(notifiable_id: id, seen: nil)
    @notifications = Notification.where(recipient_id: params[:id])

    render 'get_notifications.json.jbuilder'
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
