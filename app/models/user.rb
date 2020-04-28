# frozen_string_literal: true

class User < ApplicationRecord
  belongs_to :city
  has_many :tasks, dependent: :restrict_with_exception

  validates :first_name, presence: true, length: { maximum: 50 }
  validates :second_name, presence: true, length: { maximum: 50 }
  validates :email, presence: true, 'valid_email_2/email': true
  validates :password_digest, presence: true, length: { minimum: 8 }
  validates :phone, presence: true, length: { is: 11 }, uniqueness: true, numericality: { only_integer: true }

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
