class Comment < ApplicationRecord
  validates :body, presence: true, length: { in: 2..255 }, body: true
end
