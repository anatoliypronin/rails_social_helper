require 'test_helper'

class Web::User::TasksControllerTest < ActionDispatch::IntegrationTest
  setup do
    @task = create :task
    @user = create :user
    sign_in_as_user(@user)
  end

  test 'should get new task page' do
    get new_user_tasks_path
    assert_response :success
  end

  test 'should post create city and district' do
    task_attrs = attributes_for(:task, city_id: @user.city_id, service_id: @task.service_ids, district_id: @task.district_id)

    post user_tasks_path, params: { task: task_attrs }
    assert_response :redirect

    task = Task.last
    assert_equal task_attrs[:description], task.description
  end

  #   test 'should not post create task' do
  #     task_attrs = attributes_for :task, title: nil

  #     post user_tasks_path, params: { task: task_attrs }
  #     assert_response :success

  #     task = Task.find_by(title: task_attrs[:name])
  #     assert_nil task
  #   end
end
