class Api::V1::UserBlocksController < ApplicationController
  skip_before_action :verify_authenticity_token
  
  
  def create
    block = UserBlock.create(
      blocker_id: params[:blocker_id],
      blocked_id: params[:blocked_id]
      )
      render json: block.as_json
    end
    def destroy
      block = UserBlock.find_by(id: params[:id])
      block.destroy if block.present?
    end
  end