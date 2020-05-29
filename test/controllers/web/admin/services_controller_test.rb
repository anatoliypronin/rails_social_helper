require 'test_helper'

class Web::Admin::ServicesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @service = create :service
    admin = create :admin
    sign_in_as_admin(admin)
  end

  test 'should get index services' do
    get admin_services_path
    assert_response :success
  end

  test 'should get new service page' do
    get new_admin_service_path
    assert_response :success
  end

  test 'should not post create service' do
    service_attrs = attributes_for :service, name: nil

    post admin_services_path, params: { service: service_attrs }
    assert_response :success

    service = Service.find_by(name: service_attrs[:name])
    assert_nil service
  end

  test 'should get edit service page' do
    get edit_admin_service_path(@service.id)
    assert_response :success
  end

  test 'should put update service' do
    attrs = {}
    attrs[:name] = generate :name

    put admin_service_path(@service.id), params: { service: attrs }
    assert_response :redirect

    @service.reload
    assert_equal attrs[:name], @service.name
  end

  test 'should delete destroy service' do
    delete admin_service_path(@service.id)
    assert_response :redirect

    assert_not Service.exists?(@service.id)
  end

  test 'should update task with services' do
    @task = create :task
    attrs_service = attributes_for :service
    attrs_service[:task_ids] = [@task.id]
    put admin_service_path(@service), params: { service: attrs_service }
    assert @service.tasks.include?(@task)
  end
end
