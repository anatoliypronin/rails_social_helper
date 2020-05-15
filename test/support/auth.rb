# frozen_string_literal: true

module Support
  module Auth
    def sign_in_as_user(user)
      post user_sessions_path, params: { user: { email: user.email, password: user.password } }
    end

    def sign_out_as_user
      delete user_sessions_path
    end

    def sign_in_as_admin(admin)
      post admin_sessions_path, params: { admin: { email: admin.email, password: admin.password } }
    end

    def sign_out_as_admin
      delete admin_sessions_path
    end
  end
end
