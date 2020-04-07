class Admin < ApplicationRecord
  validates :name, presence: true, length: { minimum: 2 }
  validates :email, presence: true, uniqueness: true, format: { with: /\A\S+@.+\.\S+\z/ }
  validates :role, presence: true
end
