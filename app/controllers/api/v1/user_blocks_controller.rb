class Api::V1::UserBlocksController < ApplicationController
  skip_before_action :verify_authenticity_token
  def get_blocked_users
    id = request.headers['id'].to_i
    #query block request where sender_id is equal to user Id.
    blocks = UserBlock.where(sender_id: id)
    #declare an array for all the blocked users
    user_array = []
    #each through the blocks and push the user to the user_array
    blocks.each do |block|
        user = User.find_by(id: block[:receiver_id])
        user = {id: user[:id], firstName: user[:first_name], lastName: user[:last_name]}
        user_array.push(user)
    end
    render json: user_array
  end

  def get_blocked_by
    id = request.headers['id'].to_i
    #query block request where sender_id or receiver_id is equal to user Id.
    blocks = UserBlock.where(receiver_id: id)
    #declare an array for all the blocked users
    user_array = []
    #each through the blocks and push the user to the user_array
    blocks.each do |block|
        user = User.find_by(id: block[:sender_id])
        user = {id: user[:id], firstName: user[:first_name], lastName: user[:last_name]}
        user_array.push(user)
      end
    render json: user_array
  end
  
  def create
    if UserBlock.exists?(sender_id: params[:sender_id], receiver_id:params[:receiver_id])
      
    elsif UserBlock.exists?(sender_id: params[:receiver_id], receiver_id: params[:sender_id])
      
    else
      block_request = UserBlock.create(
        sender_id: params[:sender_id],
        receiver_id: params[:receiver_id],
        status: false)
        render json: block_request.as_json
      end
    end
    
    def destroy
      block_request = UserBlock.find_by(id: params[:id])
      block_request.destroy
    end
  end