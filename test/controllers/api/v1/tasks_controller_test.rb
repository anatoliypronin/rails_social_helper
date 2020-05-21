require 'test_helper'

class Api::V1::TasksControllerTest < ActionDispatch::IntegrationTest
  setup do
    @task = create :task
  end

  test 'shoud get tasks list' do
    get api_v1_tasks_path
    assert_response :success
  end

  test 'should get course info' do
    get api_v1_task_path(@task)
    assert_response :success

    assert_equal response.parsed_body["title"], @task.title
    assert_equal response.parsed_body["description"], @task.description
  end  
end
