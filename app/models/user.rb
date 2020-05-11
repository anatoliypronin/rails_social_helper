# frozen_string_literal: true

class User < ApplicationRecord
  include UserRepository
  include UserStateMachine

  belongs_to :city
  has_many :tasks, dependent: :restrict_with_exception

  has_secure_password

  validates :first_name, presence: true, length: { maximum: 50 }
  validates :second_name, presence: true, length: { maximum: 50 }
  validates :email, presence: true, 'valid_email_2/email': true
  validates :password, presence: true, length: { minimum: 8 }, on: :create
  validates :phone, presence: true, length: { is: 11 }, uniqueness: true, numericality: { only_integer: true }
end
