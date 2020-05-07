# frozen_string_literal: true

class City < ApplicationRecord
  has_many :users, dependent: :nullify
  has_many :districts,  dependent: :nullify

  validates :name, presence: true, length: { in: 2..60 }, name: true
end
