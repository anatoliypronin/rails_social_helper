# frozen_string_literal: true

class Company < ApplicationRecord
  has_many :tasks, dependent: :restrict_with_exception
  belongs_to :service
  belongs_to :district
  belongs_to :city
  validates :name, presence: true, uniqueness: true
  validates :city, :service, presence: true
  validates :address, presence: true, length: { minimum: 10 }
  validates :email_registration, presence: true, uniqueness: true, 'valid_email_2/email': true
  validates :email_notification, presence: true, uniqueness: true, 'valid_email_2/email': true
  validates :password, length: { minimum: 8 }, on: :create
  validates :phone, uniqueness: true, presence: true, numericality: { only_integer: true }, length: { is: 11 }

  has_secure_password

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
