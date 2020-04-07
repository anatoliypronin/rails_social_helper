class Admin < ApplicationRecord
  validates :name, presence: true, length: { minimum: 2 }
  validates :email, presence: true, uniqueness: true, 'valid_email_2/email': true
  validates :role, presence: true
  validates :password, presence: true, length: { minimum: 8 }
end