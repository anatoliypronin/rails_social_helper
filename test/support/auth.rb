# frozen_string_literal: true

module Support
  module Auth
    def sign_in_as_user(user)
      post sessions_path, params: { user: { email: user.email, password: user.password } }
    end
  end
end
