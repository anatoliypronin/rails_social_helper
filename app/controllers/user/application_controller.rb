# frozen_string_literal: true

class User::ApplicationController < ApplicationController
  before_action :authentucate_user!, only: %i[edit destroy update]
end
