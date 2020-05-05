# frozen_string_literal: true

class Web::User::ApplicationController < Web::ApplicationController
  before_action :authentucate_user!
  helper_method %i[current_user user_signed_in?]
end
