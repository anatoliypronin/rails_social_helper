module Support
  module Auth
    def sign_in_as_user(user)
      post admin_sessions_path, params: { user: { email: user.email, password: user.password } }
    end
  end
end