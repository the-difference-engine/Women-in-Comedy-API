class UserBlock < ApplicationRecord

  belongs_to :receiver, class_name: 'User', foreign_key: 'receiver_id'
  belongs_to :sender, class_name: 'User', foreign_key: 'sender_id'

  after_create do
    if ConnectionRequest.exists?(sender_id: params[:sender_id], receiver_id:params[:receiver_id])
      connection_request = ConnectionRequest.find(sender_id: params[:sender_id], receiver_id:params[:receiver_id])
      connection_request.destroy
    end
    if ConnectionRequest.exists?(sender_id: params[:receiver_id], receiver_id: params[:sender_id])
      connection_request = ConnectionRequest.find(sender_id: params[:receiver_id], receiver_id:params[:sender_id])
      connection_request.destroy
    end
  end
  
end
