class Api::V1::ConnectionRequestsController < ApplicationController

  def get_connections
    id = request.headers['id'].to_i
    #query connection request where sender_id or receiver_id is equal to user Id.
    connections = ConnectionRequest.where(sender_id: id).or(ConnectionRequest.where(receiver_id: id))
    #query connection where status is equal to connected
    connections = connections.where(status: 'connected')
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



end
