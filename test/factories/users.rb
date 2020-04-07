FactoryBot.define do
  factory :user do
    first_name { 'Name' }
    second_name { 'Secondname' }
    email { 'email@test.com' }
    password { '1234qwer' }
    phone { '+123456789' }
    state { 'active' }
  end
end
