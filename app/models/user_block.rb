class UserBlock < ApplicationRecord

  belongs_to :blocker, class_name: 'User', foreign_key: 'blocker_id'
  belongs_to :blocked, class_name: 'User', foreign_key: 'blocked_id'
  validate :unique_record
  scope :blocked_users, ->(user_id) { where(blocker_id: user_id) }
  scope :blocker_users, ->(user_id) { where(blocked_id: user_id) }

  after_create do
    connection_request = ConnectionRequest.where(sender_id: self.blocker_id, receiver_id: self.blocked_id).first
    if connection_request.present?
      connection_request.destroy
    end
    connection_request = ConnectionRequest.where(sender_id: self.blocked_id, receiver_id: self.blocker_id).first
    if connection_request.present?
      connection_request.destroy
    end
  end

  private
  def unique_record
    if UserBlock.exists?(blocker_id: self.blocker_id, blocked_id: self.blocked_id) || UserBlock.exists?(blocker_id: self.blocked_id, blocked_id: self.blocker_id)
      self.errors.add(:base, "User is already blocked")
    end 
  end
end