require 'test_helper'

class Web::Admin::TasksControllerTest < ActionDispatch::IntegrationTest
  setup do
    @task = create :task
  end

  test 'should get index task' do
    get admin_tasks_path
    assert_response :success
  end

  test 'should get new task page' do
    get new_admin_tasks_path
    assert_response :success
  end


end
