# frozen_string_literal: true

class Web::User::ProfilesController < Web::User::ApplicationController
  def edit
    @user = current_user
  end

  def update
    @user = current_user
    if @user.update(users_params)
      redirect_to root_path
    else
      render action: :edit
    end
  end

  private

  def users_params
    params.require(:user).permit(:first_name, :second_name, :phone, :password, :email, :city_id)
  end
end
