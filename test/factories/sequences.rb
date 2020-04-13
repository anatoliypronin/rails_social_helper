FactoryBot.define do
    sequence :string, aliases: [:name, :city, :district, :address, :password_digest] do |n|
        "long string#{n}"
      end

    sequence :string2, aliases: [:email_registration, :email_notification] do |n|
        "email#{n}@factory.com"
      end

    sequence :phone do 
       rand 10**10..10**11
      end 
 end
<<<<<<< HEAD
 
=======
>>>>>>> change company test and sequences
