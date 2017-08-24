class Api::V1::ConnectionRequestsController < ApplicationController

  def get_connections
    id = request.headers['id'].to_i
    #query connection request where sender_id or receiver_id is equal to user Id.
    connections = ConnectionRequest.where(sender_id: id).or(ConnectionRequest.where(receiver_id: id))
    #query connection where status is equal to connected
    connections = connections.where(status: true)
    #declare an array for all the connected users
    user_array = []
    #each through the connections and push the user to the user_array
    connections.each do |connection|
      if connection[:sender_id] == id
        user = User.find_by(id: connection[:receiver_id])
        user = {id: user[:id], firstName: user[:first_name], lastName: user[:last_name]}
        user_array.push(user)
      else
        user = User.find_by(id: connection[:sender_id])
        user = {id: user[:id], firstName: user[:first_name], lastName: user[:last_name]}
        user_array.push(user)
      end
    end
    render json: user_array
  end

def create
  if ConnectionRequest.exists?(sender_id: params[:sender_id], receiver_id:params[:receiver_id])

  elsif ConnectionRequest.exists?(sender_id: params[:receiver_id], receiver_id: params[:sender_id])

  else
    connection_request = ConnectionRequest.create(
      sender_id: params[:sender_id],
      receiver_id: params[:receiver_id],
      status: false)
    render json: connection_request.as_json
  end
  
end

def update
  connection_request = ConnectionRequest.find_by(id: params[:id])
  unless connection_request.receiver_id == current_user.id
  connection_request.update(status: params[:status])
  connection_request.save
  end
  render json: connection_request.as_json
end

def destroy
  connection_request = ConnectionRequest.find_by(id: params[:id])
  connection_request.destroy
end



end
