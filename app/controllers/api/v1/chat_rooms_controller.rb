class Api::V1::ChatRoomsController < ApplicationController
  def index
    chats = current_user.chat_rooms.all
    render json: chats
  end

  def show
    chat_room = ChatRoom.find_by(id: params[:id]).includes(:chat_messages).includes(:users).first

    if chat_room && chat_room.private
      permitted = false
      chat_room.users.each do |u|
        if u.id = current_user.id
          permitted = true
        end
      end

      if !permitted
        chat_room = nil
      end
    end

    render json: chat_room
  end

  def create
    target = User.find_by(id: params[:target_user])
    head(:conflict) unless target

    # try to find an existing chat room with these two users
    room = current_user.chat_rooms.where(:private: true).includes(:users).where("users.id" => target.id).includes(:chat_messages).first
    
    unless room
      room = current_user.chat_rooms.build(:private: true, :users: [current_user, target])
      room.save
    end

    render json: room
  end

  private

  def chat_room_params
    params.require(:target_user)
  end
end