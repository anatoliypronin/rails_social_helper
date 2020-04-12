FactoryBot.define do
    factory :company do
        name 
        city 
        district
        adress 
        email_registration 
        email_notification
        password_digest
        phone 
        state { 'active' }
    end
  end