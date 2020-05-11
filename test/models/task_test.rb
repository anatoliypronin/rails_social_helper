require 'test_helper'

class TaskTest < ActiveSupport::TestCase
  test 'Should create task' do
    task = build :task
    task.save

    created_task = Task.last
    assert created_task
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

  test 'Should not create task with invalid state property' do
    task = build :task, state: 'test'
    assert_not task.save
  end

  test 'Should change task state to deleted' do
    task = create :task
    task.del
    assert_equal 'deleted', task.state
  end
end
