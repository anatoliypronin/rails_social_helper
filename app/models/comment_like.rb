class CommentLike < ApplicationRecord
  belongs_to :comment
  belongs_to :like_comment
  validates :comment, uniqueness: { scope: :like_comment }
end
