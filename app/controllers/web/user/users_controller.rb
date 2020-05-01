# frozen_string_literal: true

class Web::User::UsersController < Web::User::ApplicationController
  def index
    @users = policy_scope(User).decorate
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
    @user = policy_scope(User).find(params[:id]).decorate
  end

  def edit
    @user = policy_scope(User).find(params[:id])
    authorize @user
  end

  def update
    @user = policy_scope(User).find(params[:id])
    authorize @user

    if @user.update(users_params)
      redirect_to action: :show
    else
      render action: :edit
    end
  end

  def users_params
    params.require(:user).permit(:first_name, :second_name, :phone, :password, :email, :city_id)
  end
end
