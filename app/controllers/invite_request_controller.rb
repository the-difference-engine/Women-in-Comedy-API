class Api::V1::InviteRequestController < ApplicationController
    def get_invites
        id = request.headers['id'].to_i

        invites = InviteRequest.where(sender_id: id).(InviteRequest.where(receiver_id: id))

        invites = invites.where(status: true)

        user_array = []

        invites.each do |invite|
            if invite[:sender_id] == id
                user = User.find_by(id: invite[:receiver_id])
                user = {id: user[:id], firstName: user[:first_name], lastName: user[:last_name]}
                user_array.push(user)
            else
                user = User.find_by(id: invite[sender_id])
                user = {id: user[:id], firstName: user[:first_name], lastName: user[:last_name]}
                user_array.push(user)
            end
        end
        render json: user_array
    end

    def get_pending_invites
        id = request.headers['id'].to_i

        invites = InviteRequest.where(receiver_id: id)

        pending_invites = invites.where(status: false)

        user_array = []
        
        pending_invites.each do |invite|
            user = User.find_by(id: invite[sender_id])
            user = {id: user[:id], firstName: user[:first_name], lastName: user[:last_name]}
            user_array.push(user)
        end
        render json: user_array
    end

    def create
        if InviteRequest.exists?(sender_id: params[:sender_id], receiver_id: params[:receiver_id])

        elsif InviteRequest.exists?(sender_id: params[:receiver_id], receiver_id: params[:sender_id])

        else
            invite_request = InviteRequest.create(
                sender_id: params[:sender_id],
                receiver_id: params[:receiver_id],
                event_id: params[:event_id],
                status: false
            )
        render json: invite_request.as_json
    end

    def update
        invite_request = InviteRequest.find_by(id: params[:id])
        invite_request.update(status: params[:status])
        invite_request.save
        render json: invite_request.as_json
    end

    def destroy
        invite_request = InviteRequest.find_by(id: params[:id])
        invite_request.destroy
    end

    def status
        invite = InviteRequest.where(sender_id: params[:sender_id], receiver_id: params[:receiver_id]).or(InviteRequest.where(sender_id: params[:receiver_id], receiver_id: params[:sender_id])
        render json: invite[0]
    end

    def accept
        invite = InviteRequest.find_by(sender_id: params[:sender_id], receiver_id: params[:receiver_id])
        invite.update(status: true)
        invite.save
        render json: invite.as_json
    end
end