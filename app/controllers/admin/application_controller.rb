# frozen_string_literal: true

class Admin::ApplicationController < ApplicationController
  before_action :authentucate_user!
  helper_method :current_user
end
