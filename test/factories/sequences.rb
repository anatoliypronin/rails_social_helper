# frozen_string_literal: true

FactoryBot.define do
  sequence :string, aliases: %i[city district address password_digest second_name first_name] do |n|
    "long string#{n}"
  end

  sequence :string2, aliases: %i[email_registration email_notification email] do |n|
    "email-#{n}@factory.com"
  end

  sequence :phone do
    rand(10**10..10**11).to_s
  end

  sequence :name do
    ('а'..'я').to_a.sample(8).join
  end
end
