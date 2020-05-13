class Comment < ApplicationRecord
  validates :body, presence: true
  has_many :like_comments, through: :comment_likes
end
