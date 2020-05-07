# frozen_string_literal: true

class Service < ApplicationRecord
  has_many :companies
  validates :name, presence: true, uniqueness: true, length: { in: 2..60 }, name: true
end
