# frozen_string_literal: true

class Service < ApplicationRecord
  has_many :task_services, dependent: :destroy
  has_many :tasks, through: :task_services
  has_many :companies, dependent: :nullify
  validates :name, presence: true, uniqueness: true, length: { in: 2..60 }, name: true
end
