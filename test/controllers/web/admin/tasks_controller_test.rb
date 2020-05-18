require 'test_helper'

class Web::Admin::TasksControllerTest < ActionDispatch::IntegrationTest
  setup do
    @task = create :task
    admin = create :admin
    sign_in_as_admin(admin)
  end

  test 'should get index tasks' do
    get admin_tasks_path
    assert_response :success
  end

  test 'should get new task page' do
    get new_admin_task_path
    assert_response :success
  end

  test 'should post create city and district' do
    task_attrs = attributes_for(:task)
    task_attrs[:user_id] = @task.user_id
    task_attrs[:city_id] = @task.city_id
    task_attrs[:district_id] = @task.district_id


    post admin_tasks_path, params: { task: task_attrs }
    assert_response :redirect

    task = Task.last
    assert_equal task_attrs[:description], task.description
  end

  test 'should not post create task' do
    task_attrs = attributes_for :task, title: nil

    post admin_tasks_path, params: { task: task_attrs }
    assert_response :success

    task = Task.find_by(title: task_attrs[:name])
    assert_nil task
  end

  test 'should get show task page' do
    get admin_task_path(@task.id)
    assert_response :success
  end

  test 'should get edit task page' do
    get edit_admin_task_path(@task.id)
    assert_response :success
  end

  test 'should put update task' do
    attrs = {}
    attrs[:title] = generate :title
    attrs[:description] = generate :description

    put admin_task_path(@task.id), params: { task: attrs }
    assert_response :redirect

    @task.reload
    assert_equal attrs[:title], @task.title
  end

  test 'should state del task' do
   put admin_task_del_path(@task.id)
   assert_response :redirect
   @task.reload
   assert_equal 'deleted', @task.state
 end

 test 'should state active task' do
   @task.del!
   put admin_task_restore_path(@task.id)
   assert_response :redirect

   @task.reload
   assert_equal 'active', @task.state
 end
end
