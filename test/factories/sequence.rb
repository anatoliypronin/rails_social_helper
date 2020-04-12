FactoryBot.define do
  sequence :string, aliases: %i[second_name first_name password_digest] do |n|
    "String-#{n}"
  end

  sequence :email do |n|
    "Email-#{n}@test.com"
  end

  sequence :phone do
    rand 10**10..10**11
  end

  sequence :name do
    ('а'..'я').to_a.sample(8).join
  end
end
