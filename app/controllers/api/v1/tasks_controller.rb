class Api::V1::TasksController < Api::V1::ApplicationController
  def index
    tasks = Task.active.order(created_at: :desc)
    render json: tasks, each_serializer: TaskIndexSerializer
  end

  def show
    task = Task.active.find(params[:id])
    render json: task, serializer: TaskIndexSerializer
  end
end
