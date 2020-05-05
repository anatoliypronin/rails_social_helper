# frozen_string_literal: true

module Support
  module Auth
    def sign_in_as_user(user)
      post user_sessions_path, params: { user: { email: user.email, password: user.password } }
    end

    def sign_out_as_user
      session.delete(:user_id)
    end
  end
end
