# frozen_string_literal: true

class City < ApplicationRecord
  has_many :users, dependent: :nullify
  has_many :districts

  validates :name, presence: true, length: { in: 2..60 }, format: { with: /\A([а-яА-Я]+( |-)){0,2}[а-яА-Я]+\z/ }
end
