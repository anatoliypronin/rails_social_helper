# frozen_string_literal: true

module AuthHelper
  def user_sign_in(user)
    session[:user_id] = user.id
  end

  def user_sign_out
    session.delete(:user_id)
  end

  def current_user
    User.find_by(id: session[:user_id])
  end

  def user_signed_in?
    current_user
  end

  def authenticate_user!
    redirect_to new_user_sessions_path unless user_signed_in?
  end

  def admin_sign_in(admin)
    session[:admin_id] = admin.id
  end

  def admin_sign_out
    session.delete(:admin_id)
  end

  def current_admin
    Admin.find_by(id: session[:admin_id])
  end

  def admin_signed_in?
    current_admin
  end

  def authenticate_admin!
    redirect_to new_admin_sessions_path unless admin_signed_in?
  end

end
