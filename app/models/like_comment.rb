class LikeComment < ApplicationRecord
  has_many :users, through: :like_comment_users
  has_many :comment_likes, through: :comment_likes
end
