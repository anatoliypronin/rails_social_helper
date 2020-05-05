class Admin < ApplicationRecord
  extend Enumerize

  validates :name, presence: true, length: { minimum: 2 }
  validates :email, presence: true, uniqueness: true, 'valid_email_2/email': true
  validates :password, presence: true, length: { minimum: 8 }

  has_secure_password

  enumerize :role, in: %i[admin editor], default: :admin
end