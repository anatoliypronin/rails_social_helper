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

  def authentucate_user!
    redirect_to new_session_path unless user_signed_in?
  end

  def page_owner?(id)
    current_user.id == id.to_i
  end

  def permissions_for_user_page(id)
    redirect_to users_path unless page_owner?(id)
  end
end
