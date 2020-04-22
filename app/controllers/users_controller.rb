# frozen_string_literal: true

class UsersController < ApplicationController
  def index
    @users = User.all
    @cities = City.all
  end

  def new
    @user = User.new
    @cities = City.all
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
    @cities = City.all
  end

  def update
    @user = User.find(params[:id])

    if @user.update(users_params)
      redirect_to action: :index
    else
      redirect_to action: :edit
    end
  end

  def destroy
    user = User.find(params[:id])
    user.destroy

    redirect_to action: :index
  end

  def users_params
    params.require(:user).permit(:first_name, :second_name, :phone, :password_digest, :email, :city_id)
  end
end
