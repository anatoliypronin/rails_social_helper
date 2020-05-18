class Web::Admin::TasksController < Web::Admin::ApplicationController
  def index
    @tasks = Task.all
  end

  def new
    @task = Task.new
  end

  def create
    @task = Task.new(task_attrs)
    if @task.save
      redirect_to action: :index
    else
      render action: :new
    end
  end

  def show
    @task = Task.find(params[:id])
  end

  def edit
    @task = Task.find(params[:id])
  end

  def update
    @task = Task.find(params[:id])
    task_attrs = send("task_attrs")
    if @task.update(task_attrs)
      redirect_to admin_tasks_path
    else
      render action: :edit
    end
  end

  def destroy
    task = Task.find(params[:id])
    task.destroy
    redirect_to action: :index
  end

  def del
    task = Task.find(params[:id])
    task.del
    redirect_to action: :index
  end

  def restore
    task = Task.find(params[:id])
    task.restore
    redirect_to action: :index
  end

  def close
    task = Task.find(params[:id])
    task.close
    redirect_to action: :index
  end

  def to_open
    task = Task.find(params[:id])
    task.to_open
    redirect_to action: :index
  end

  private

  def task_attrs
    params.require(:task).permit(:description, :title, :address, :state, :user_id, :city_id, :district_id)
  end
end
