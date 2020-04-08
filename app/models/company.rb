class Company < ApplicationRecord
    validates :name, :city, :district, :adress, :email_registration, :email_notification, :password_digest, :phone,
              presence: true
    validates :name, uniqueness: true
    validates :city, length: { in: 2..60 }
    validates :district, length: { in: 2..60 }
    validates :adress, length: { minimum: 10 }
    validates :email_registration, uniqueness: true, 'valid_email_2/email': true
    validates :email_notification, uniqueness: true, 'valid_email_2/email': true
    validates :password_digest, length: { minimum: 8 }
    validates :state, inclusion: { in: %w[active deleted] }
    validates :phone, uniqueness: true, numericality: { only_integer: true }, length: { is: 11 }
    

end
