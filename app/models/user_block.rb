class UserBlock < ApplicationRecord

  belongs_to :blocker, class_name: 'User', foreign_key: 'blocker_id'
  belongs_to :blocked, class_name: 'User', foreign_key: 'blocked_id'
  validate :unique_record
  scope :blocked_users, ->(user_id) { where(blocker_id: user_id) }
  scope :blocker_users, ->(user_id) { where(blocked_id: user_id) }

  def get_blocked_users
    id = request.headers['id'].to_i
    #query block request where blocker_id is equal to user Id and blocked_id is equal to User id.
    # block_ids = UserBlock.where(blocker_id: id).or(UserBlock.where(blocked_id: id))
    block_ids = UserBlock.all().map { |UserBlock| UserBlock.map { |id| id == user_id ? nil : id}}.to_set
    
    
    #declare an array for all the blocked users
    user_array = []
    #each through the blockers and push the user to the user_array
    blockers.each do |block|
      user = User.find_by(id: block[:blocked_id])
      user = {id: user[:id], firstName: user[:first_name], lastName: user[:last_name]}
      user_array.push(user)
    end
    blocked_bys.each do |block|
      user = User.find_by(id: block[:blocker_id])
      user = {id: user[:id], firstName: user[:first_name], lastName: user[:last_name]}
      user_array.push(user)
    end
    render json: user_array.uniq
  end
  def get_blocked_by
    id = request.headers['id'].to_i
    #query block request where blocker_id or blocked_id is equal to user Id.
    blocks = UserBlock.where(blocked_id: id)
    #declare an array for all the blocked users
    user_array = []
    #each through the blocks and push the user to the user_array
    blocks.each do |block|
      user = User.find_by(id: block[:blocker_id])
      user = {id: user[:id], firstName: user[:first_name], lastName: user[:last_name]}
      user_array.push(user)
    end
    render json: user_array
  end
  
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