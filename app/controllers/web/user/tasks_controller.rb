class Web::User::TasksController < Web::User::ApplicationController
  def new
    @task = Task.new
  end

  def create
    @task = Task.new(task_attrs)
    @task[:user_id] = current_user.id
    if @task.save
      redirect_to root_path
    else
      render action: :new
    end
  end

  private

  def task_attrs
    params.require(:task).permit(:description, :title, :address, :state, :user_id, :city_id, :district_id, :state, service_ids: [])
  end
end
