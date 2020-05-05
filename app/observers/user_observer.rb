# frozen_string_literal: true

class UserObserver < ActiveRecord::Observer
  observe :user

  def after_save(record)
    UserMailer.welcome_email(record).deliver_now
  end
end
