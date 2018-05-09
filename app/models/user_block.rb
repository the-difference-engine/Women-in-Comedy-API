class UserBlock < ApplicationRecord

  belongs_to :receiver, class_name: 'User', foreign_key: 'receiver_id'
  belongs_to :sender, class_name: 'User', foreign_key: 'sender_id'

  after_create do
    connection_request = ConnectionRequest.where(sender_id: self.sender_id, receiver_id: self.receiver_id).first
    if connection_request.present?
      connection_request.destroy
    end
  else
    connection_request = ConnectionRequest.where(sender_id: self.receiver_id, receiver_id: self.sender_id).first
    if connection_request.present?
      connection_request.destroy
    end
  end
end