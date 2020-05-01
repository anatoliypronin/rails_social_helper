# frozen_string_literal: true

class UserPolicy < ApplicationPolicy
  def update?
    user == record
  end

  def edit?
    update?
  end

  class Scope
    attr_reader :user, :scope

    def initialize(user, scope)
      @user = user
      @scope = scope
    end

    def resolve
      scope.active
    end
  end
end
