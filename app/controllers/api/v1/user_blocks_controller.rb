class Api::V1::UserBlocksController < ApplicationController
  skip_before_action :verify_authenticity_token
  
  def get_blocked_users
    id = request.headers['id'].to_i
    #query block request where blocker_id is equal to user Id and blocked_id is equal to User id.
    blockers = UserBlock.where(blocker_id: id)
    blocked_bys = UserBlock.where(blocked_id: id)
    
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
  def create
    block = UserBlock.create(
      blocker_id: params[:blocker_id],
      blocked_id: params[:blocked_id]
    )
    render json: block.as_json
  end
  def destroy
    block = UserBlock.find_by(id: params[:id])
    if block.exists?
      block.destroy
    end 
  end
end