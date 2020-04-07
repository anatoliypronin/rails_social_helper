FactoryBot.define do
  factory :admin do
    name
    email
    role { "admin" }
  end
end