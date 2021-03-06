class Api::V1::MainController < ApplicationController
  before_action :force_json, only: :search

  def index; end

  def search
    users = User.ransack(first_name_or_last_name_or_email_cont: params[:q]).result(distinct: true).limit(10)
    render json: users.as_json(only: [:q, :first_name, :last_name, :id])
  end

  private

  def force_json
    request.format = :json
  end
end
