require 'test_helper'

class TaskTest < ActiveSupport::TestCase
  test 'Should create task' do
    task = build :task
    assert task.save
  end

  test 'Should not create task without description' do
    task = build :task, description: nil
    assert_not task.save
  end

  test 'Should not create task without title' do
    task = build :task, title: nil
    assert_not task.save
  end

  test 'Should not create task without address' do
    task = build :task, address: nil
    assert_not task.save
  end

  test 'Should not create task without state' do
    task = build :task, state: nil
    assert_not task.save
  end

  test 'Should not create user with invalid state property' do
    user = build :user, state: 'test'
    assert_not user.save
  end

  test 'Should change user state to deleted' do
    user = create :user
    user.del
    assert_equal 'deleted', user.state
  end
end
