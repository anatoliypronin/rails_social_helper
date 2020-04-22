class Company < ApplicationRecord
  validates :name, presence: true, uniqueness: true
  validates :city, presence: true, length: { in: 2..60 }
  validates :district, presence: true, length: { in: 2..60 }
  validates :adress, presence: true, length: { minimum: 10 }
  validates :email_registration, presence: true, uniqueness: true, 'valid_email_2/email': true
  validates :email_notification, presence: true, uniqueness: true, 'valid_email_2/email': true
  validates :password_digest, presence: true, length: { minimum: 8 }
  validates :state, inclusion: { in: %w[active deleted] }
  validates :phone, uniqueness: true, presence: true, numericality: { only_integer: true }, length: { is: 11 }  
end
