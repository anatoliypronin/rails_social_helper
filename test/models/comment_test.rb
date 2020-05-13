require 'test_helper'

class CommentTest < ActiveSupport::TestCase
  test "should create Comment" do
    comment = build :comment
    comment.save
    created_comment = Comment.last
    assert created_comment
  end
  test "should not create Comment with empty body" do
    comment = build :comment, body: nil
    comment.save
    created_comment = Comment.last
    assert_nil created_comment
  end
end
