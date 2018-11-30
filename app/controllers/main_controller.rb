class MainController < ApplicationController
  before_action :force_json, only: :search

  def index; end

  def search
    @users = User.ransack(first_name_or_last_name_cont: params[:q]).result(distinct: true).limit(10)
    # render json: users.as_json(only: [:q, :first_name, :last_name])
  end

  private

  def force_json
    request.format = :json
  end
end
