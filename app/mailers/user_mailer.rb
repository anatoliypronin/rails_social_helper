# frozen_string_literal: true

class UserMailer < ApplicationMailer
  def welcome_email(user)
    @user = user.decorate
    mail(to: @user.email, subject: default_i18n_subject(full_name: @user.full_name))
  end
end
