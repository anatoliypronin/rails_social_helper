FactoryBot.define do
  sequence :name do |n|
    "string#{n}"
  end
  sequence :email do |n|
    "email#{n}@factory.com"
  end
end
  