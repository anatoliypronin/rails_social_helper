class TaskDecorator < ApplicationDecorator
  def full_address
    "#{object.description} #{object.title} #{object.address}"
  end
end
