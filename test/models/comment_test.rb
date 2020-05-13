require 'test_helper'

class CommentTest < ActiveSupport::TestCase
  test "should create CommentTest" do
    tag = build :tag
    tag.save
    created_tag = Tag.last
    assert created_tag
  end
  test "should not create CommentTest with empty body" do
    tag = build :tag, title: nil
    tag.save
    created_tag = Tag.last
    assert_nil created_tag
  end
end
