class Api::V1::ConnectionRequestsController < ApplicationController
  skip_before_action :verify_authenticity_token

  # TODO: Rename this & reduce ABC score
  def get_connections
    id = request.headers['id'].to_i
    connections = ConnectionRequest.where(sender_id: id).or(ConnectionRequest.where(receiver_id: id))
    connections = connections.where(status: true)
    user_array = []
    connections.each do |connection|
      if connection[:sender_id] == id
        user = User.find_by(id: connection[:receiver_id])
      else
        user = User.find_by(id: connection[:sender_id])
      end
      user = {
        id: user[:id],
        firstName: user[:first_name],
        lastName: user[:last_name]
      }
      user_array.push(user)
    end
    render json: user_array
  end

  # TODO: Rename this & reduce ABC score
  def get_pending_connections
    id = request.headers['id'].to_i
    connections = ConnectionRequest.where(receiver_id: id)
    pending_connections = connections.where(status: false)
    user_array = []
    pending_connections.each do |connection|
      user = User.find_by(id: connection[:sender_id])
      user = {
        requestId: connection[:id],
        senderId: user[:id],
        firstName: user[:first_name],
        lastName: user[:last_name]
      }
      user_array.push(user)
    end
    render json: user_array
  end

  # TODO: Reduce ABC score
  def create
    if ConnectionRequest.exists?(sender_id: params[:sender_id], receiver_id: params[:receiver_id])
    elsif ConnectionRequest.exists?(sender_id: params[:receiver_id], receiver_id: params[:sender_id])
    else
      connection_request = ConnectionRequest.create(
        sender_id: params[:sender_id],
        receiver_id: params[:receiver_id],
        status: false
      )

      sender = User.find_by(id: params[:sender_id])
      receiver = User.find_by(id: params[:receiver_id])

      Notification.create(
        user: sender,
        recipient: receiver,
        action: 'connection_request'
      )

      render json: connection_request.as_json
    end
  end

  def update
    connection_request = ConnectionRequest.find_by(id: params[:id])
    connection_request.update(status: params[:status])
    connection_request.save
    render json: connection_request.as_json
  end

  def destroy
    connection_request = ConnectionRequest.find_by(id: params[:id])
    connection_request.destroy
  end

  def status
    # TODO: There has to be a simpler way to do this
    connection = ConnectionRequest.where(
      sender_id: params[:sender_id],
      receiver_id: params[:receiver_id]
    ).or(
      ConnectionRequest.where(
        sender_id: params[:receiver_id],
        receiver: params[:sender_id]
      )
    )
    render json: connection[0]
  end

  # TODO: Reduce ABC score
  def accept
    connection = ConnectionRequest.find_by(sender_id: params[:sender_id], receiver_id: params[:receiver_id])
    connection.update(status: true)
    connection.save

    connection_request_sender = User.find_by(id: params[:sender_id])
    connection_request_receiver = User.find_by(id: params[:receiver_id])

    Notification.create(
      user: connection_request_receiver,
      recipient: connection_request_sender,
      action: 'connection_accepted'
    )

    render json: connection.as_json
  end
end
