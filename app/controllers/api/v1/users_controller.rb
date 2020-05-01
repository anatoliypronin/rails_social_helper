class Api::V1::UsersController < Api::V1::ApplicationController
  def index
    users = User.active.order(second_name: :asc)
    render json: users, each_serializer: UserIndexSerializer
  end

  def show
    user = User.active.find(params[:id])
    render json: user, serializer: UserShowSerializer
  end
end