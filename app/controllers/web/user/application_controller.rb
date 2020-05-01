# frozen_string_literal: true

class Web::User::ApplicationController < Web::ApplicationController
  before_action :authentucate_user!, only: %i[edit destroy update]
end
