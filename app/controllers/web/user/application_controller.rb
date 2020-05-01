# frozen_string_literal: true

class Web::User::ApplicationController < Web::ApplicationController
  rescue_from Pundit::NotAuthorizedError, with: :forbidden

  private

  def forbidden
    redirect_to users_path
  end
end
