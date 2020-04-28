# frozen_string_literal: true

class UserDecorator < ApplicationDecorator
  delegate_all

  def full_name
    object.first_name + ' ' + object.second_name
  end

  def created_at
    object.created_at.strftime('%A, %B, %e')
  end

  def updated_at
    object.updated_at.strftime('%A, %B, %e')
  end
end
