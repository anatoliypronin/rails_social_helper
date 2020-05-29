# frozen_string_literal: true

require 'test_helper'

class Web::CommentsControllerTest < ActionDispatch::IntegrationTest
  test 'shoud post create comment admin' do
    admin = create :admin
    sign_in_as_admin(admin)
    task = create :task

    comment_attr = attributes_for(:comment)
    post task_comments_path(task.id), params: { comment: comment_attr }
    assert_response :redirect
  end

  test 'shoud post create comment user' do
    user = create :user
    sign_in_as_user(user)
    task = create :task

    comment_attr = attributes_for(:comment)
    post task_comments_path(task.id), params: { comment: comment_attr }
    assert_response :redirect
  end
end
