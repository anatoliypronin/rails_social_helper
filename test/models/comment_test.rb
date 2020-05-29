require 'test_helper'

class CommentTest < ActiveSupport::TestCase
  setup do
    @task = build :task
    @task.save
  end

  test "should create Comment" do
    comment = build :comment, task_id: @task.id
    comment.save
    created_comment = Comment.last
    assert created_comment
  end

  test "should not create Comment with empty body" do
    comment = build :comment, body: nil, task_id: @task.id
    comment.save
    created_comment = Comment.last
    assert_nil created_comment
  end
end
