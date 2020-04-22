class User < ApplicationRecord
  validates :first_name, presence: true, length: { maximum: 50 }
  validates :second_name, presence: true, length: { maximum: 50 }
  validates :email, presence: true, 'valid_email_2/email': true
  validates :password, presence: true, length: { minimum: 8 }
  validates :phone, presence: true, uniqueness: true, numericality: { only_integer: true }
  validates :state, inclusion: { in: %w[active deleted] }
end
