FactoryBot.define do
    sequence :string, aliases: [:name, :city, :district, :address, :password_digest] do |n|
        "long string#{n}"
      end
    sequence :email_registration do |n|
        "email#{n}@factory.com"
      end
    sequence :email_notification do |n|
        "email#{n}@factory.com"
      end
    sequence :phone do |n|
       "1234567890#{n}"
      end 
 end
