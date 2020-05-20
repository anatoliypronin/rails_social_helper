# frozen_string_literal: true

class Web::ApplicationController < ApplicationController
  helper_method :user_signed_in?, :admin_signed_in?, :current_admin, :current_user
end
