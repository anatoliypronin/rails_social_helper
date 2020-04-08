FactoryBot.define do
    factory :company do
        name { 'Name' } 
        city { 'City' }
        district { 'District' }
        adress { 'Region, street, index' }
        email_registration { 'emailr@test.com' }
        email_notification { 'emailn@test.com' }
        password_digest { '987654FR' }
        phone { '12345678910' }
        state { 'active' }
    end
  end