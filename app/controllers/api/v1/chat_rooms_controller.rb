class Api::V1::ChatRoomsController < ApplicationController
  def index
    @chat_rooms = ChatRoom.all
  end

  def show
    @chat_room = ChatRoom.includes(:messages).find_by(id: params[:id])
  end

  def new
    @chat_room = ChatRoom.new
  end

  def create
    target = User.find_by(id: params[:target_user])
    head(:conflict) unless target?

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