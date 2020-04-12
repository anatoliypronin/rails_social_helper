FactoryBot.define do
  factory :user do
    first_name
    second_name
    email
    password
    phone
    state { 'active' }
  end
end
