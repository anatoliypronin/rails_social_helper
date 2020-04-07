class City < ApplicationRecord
  validates :name, presence: true
  validates :name, length: { in: 2..60 }
  validates :name, format: { with: /\A([a-zA-Z]+( |-)){0,2}[a-zA-Z]+\z/ }
end
