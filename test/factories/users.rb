# frozen_string_literal: true

FactoryBot.define do
  factory :user do
    city
    first_name
    second_name
    email
    password { 'qweasdzxc' }
    phone
  end
end
