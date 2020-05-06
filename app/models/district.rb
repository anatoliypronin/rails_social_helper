# frozen_string_literal: true

class District < ApplicationRecord
  belongs_to :city
  has_many :companies, dependent: :nullify

  validates :name, presence: true, length: { in: 2..60 }, format: { with: /\A([а-яА-Я]+( |-)){0,2}[а-яА-Я]+\z/ }
end
