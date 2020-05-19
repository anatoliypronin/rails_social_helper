class LikeCommentUser < ApplicationRecord
  belongs_to :user
  belongs_to :like_comment
  validates :user, uniqueness: { scope: :like_comment }
end
