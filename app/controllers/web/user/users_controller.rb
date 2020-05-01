# frozen_string_literal: true

class Web::User::UsersController < Web::User::ApplicationController
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
    permissions_for_user_page(params[:id])
    @user = User.find(params[:id])
  end

  def update
    permissions_for_user_page(params[:id])
    @user = User.find(params[:id])

    if @user.update(users_params)
      redirect_to action: :show
    else
      render action: :edit
    end
  end

  def destroy
    permissions_for_user_page(params[:id])
    user = User.find(params[:id])
    user.destroy

    redirect_to new_session_path
  end

  def users_params
    params.require(:user).permit(:first_name, :second_name, :phone, :password, :email, :city_id)
  end
end
