# frozen_string_literal: true

FactoryBot.define do
<<<<<<< HEAD
  sequence :string, aliases: %i[name city district address password_digest] do |n|
    "long string#{n}"
  end

  sequence :string2, aliases: %i[email_registration email_notification] do |n|
=======
  sequence :string, aliases: %i[city district address password_digest second_name first_name] do |n|
    "long string#{n}"
  end

  sequence :string2, aliases: %i[email_registration email_notification email] do |n|
>>>>>>> e01f4ac0e53975f7d85bee653554551a4227e17d
    "email#{n}@factory.com"
  end

  sequence :phone do
<<<<<<< HEAD
    rand 10**10..10**11
=======
    (rand 10**10..10**11).to_s
  end

  sequence :name do
    ('а'..'я').to_a.sample(8).join
>>>>>>> e01f4ac0e53975f7d85bee653554551a4227e17d
  end
end
