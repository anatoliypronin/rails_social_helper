require 'test_helper'

class CommentTest < ActiveSupport::TestCase
  test "should create comment" do
    comment = build :comment
    comment.save
    created_comment = Comment.last
    assert created_comment
  end
  test "should not create comment with empty title" do
    comment = build :comment, body: nil
    comment.save
    created_comment = Comment.last
    assert_nil created_comment
  end
end
