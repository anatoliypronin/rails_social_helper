# frozen_string_literal: true

class Web::User::ApplicationController < Web::ApplicationController
  before_action :authenticate_user!
end
