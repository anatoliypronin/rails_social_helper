# frozen_string_literal: true

class Web::Admin::UsersController < Web::Admin::ApplicationController
  def index
    @q = User.ransack(params[:q])
    @users = @q.result.all.paginate(page: params[:page]).decorate
  end

  def new
    @user = User.new.decorate
  end

  def create
    @user = User.new(users_params)
    if @user.save
      redirect_to action: :index
    else
      render action: :new
    end
  end

  def show
    @user = User.find(params[:id]).decorate
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])

    if @user.update(users_params)
      redirect_to action: :index
    else
      render action: :edit
    end
  end

  def del
    user = User.find(params[:user_id])
    user.del
    redirect_to action: :index
  end

  def restore
    user = User.find(params[:user_id])
    user.restore
    redirect_to action: :index
  end

  def users_params
    params.require(:user).permit(:first_name, :second_name, :phone, :password, :email, :city_id)
  end
end
