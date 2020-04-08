FactoryBot.define do
  factory :user do
    first_name { 'Name' }
    second_name { 'Secondname' }
    email { 'email@test.com' }
    password_digest { '1234qwer' }
    phone { '12345678900' }
    state { 'active' }
  end
end
