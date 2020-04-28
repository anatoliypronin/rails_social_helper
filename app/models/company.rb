# frozen_string_literal: true

class Company < ApplicationRecord
  validates :name, presence: true, uniqueness: true
  validates :city, presence: true, length: { in: 2..30 }
  validates :district, presence: true, length: { in: 2..60 }
  validates :address, presence: true, length: { minimum: 10 }
  validates :email_registration, presence: true, uniqueness: true, 'valid_email_2/email': true
  validates :email_notification, presence: true, uniqueness: true, 'valid_email_2/email': true
<<<<<<< HEAD
  validates :password_digest, presence: true, uniqueness: true, length: { minimum: 8 }
  validates :phone, uniqueness: true, presence: true, numericality: { only_integer: true }, length: { is: 11 }
=======
  validates :password, length: { minimum: 8 }
  validates :phone, uniqueness: true, presence: true, numericality: { only_integer: true }, length: { is: 11 }

  has_secure_password
>>>>>>> e01f4ac0e53975f7d85bee653554551a4227e17d

  state_machine initial: :active do
    state :active
    state :deleted

    event :del do
      transition active: :deleted
    end

    event :restore do
      transition deleted: :active
    end
  end
end
