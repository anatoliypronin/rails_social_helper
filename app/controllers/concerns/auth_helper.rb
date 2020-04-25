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
end
