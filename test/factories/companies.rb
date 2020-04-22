# frozen_string_literal: true

FactoryBot.define do
  factory :company do
    name
    city { generate :city }
    district
    address
    email_registration
    email_notification
    password_digest
    phone
  end
end
