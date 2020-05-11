# frozen_string_literal: true

FactoryBot.define do
  factory :admin do
    name
    email
    password { '1' * 9 }

    trait :editor do
      role { 'editor' }
    end
  end
end
