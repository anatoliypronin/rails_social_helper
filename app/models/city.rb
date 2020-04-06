class City < ApplicationRecord
  validates :name, presence: true
  validates :name, length: { in: 2..60 }
end
