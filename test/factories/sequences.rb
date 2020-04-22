# frozen_string_literal: true

FactoryBot.define do
  sequence :string, aliases: %i[name city district address password_digest] do |n|
    "long string#{n}"
  end

  sequence :string2, aliases: %i[email_registration email_notification] do |n|
    "email#{n}@factory.com"
  end

<<<<<<< HEAD
    sequence :phone do 
       rand 10**10..10**11
      end 
 end
<<<<<<< HEAD
 
=======
>>>>>>> change company test and sequences
=======
  sequence :phone do
    rand 10**10..10**11
  end
end
>>>>>>> fix rubocop mistakes
