# frozen_string_literal: true

class Web::Admin::UsersController < Web::Admin::ApplicationController
  def index
    @users = User.all.decorate
  end

  def new
    @user = User.new
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
    @user = User.find(params[:id])
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

  def destroy
    user = User.find(params[:id])
    user.destroy

    redirect_to action: :index
  end

  def users_params
    params.require(:user).permit(:first_name, :second_name, :phone, :password, :email, :city_id)
  end
end
