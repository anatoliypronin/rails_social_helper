# frozen_string_literal: true

class Web::User::UsersController < Web::User::ApplicationController
  def new
    @user = User.new
  end

  def create
    @user = User.new(users_params)
    if @user.save
      redirect_to action: :show
    else
      render action: :new
    end
  end

  def show
    @user = current_user.decorate
  end

  def edit
    @user = current_user
  end

  def update
    @user = current_user

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
