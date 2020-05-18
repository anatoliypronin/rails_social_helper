# frozen_string_literal: true

class UserDecorator < ApplicationDecorator
  def full_name
    "#{object.first_name} #{object.second_name}"
  end
end
