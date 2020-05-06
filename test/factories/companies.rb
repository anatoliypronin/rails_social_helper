# frozen_string_literal: true

FactoryBot.define do
  factory :company do
    name
    city { generate :city }
    district { create :district }
    address
    email_registration
    email_notification
    password { '1234567890' }
    phone
    service { create :service }
  end
end
