class UserBlock < ApplicationRecord

  belongs_to :blocker, class_name: 'User', foreign_key: 'blocker_id'
  belongs_to :blocked, class_name: 'User', foreign_key: 'blocked_id'
  validate :unique_record

  after_create do
    connection_request = ConnectionRequest.where(sender_id: self.blocker_id, receiver_id: self.blocked_id).first
    if connection_request.present?
      connection_request.destroy
    end
  else
    connection_request = ConnectionRequest.where(sender_id: self.blocked_id, receiver_id: self.blocker_id).first
    if connection_request.present?
      connection_request.destroy
    end
  end

  private
  def unique_record
    if UserBlock.exists?(blocker_id: self.blocker_id, blocked_id: self.blocked_id) || UserBlock.exists?(blocker_id: self.blocked_id, blocked_id: self.blocker_id)
      return false
    end 
  end
end