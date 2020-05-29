class Comment < ApplicationRecord
  validates :body, presence: true
  has_many :like_comments, through: :comment_likes
  has_many :users, through: :comment_users
  belongs_to :author, polymorphic: true
end
