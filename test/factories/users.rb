FactoryBot.define do
  factory :user do
    first_name
    second_name
    email
    password_digest
    phone
    state { 'active' }
  end
end
