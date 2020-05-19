require 'test_helper'

class Web::Admin::DistrictsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @district = create :district
    admin = create :admin
    sign_in_as_admin(admin)
  end

  test 'should get index districts' do
    get admin_districts_path
    assert_response :success
  end

  test 'should get new district page' do
    get new_admin_district_path
    assert_response :success
  end

  test 'should post create district' do
    district_attrs = attributes_for(:district)
    district_attrs[:city_id] = @district.city_id

    post admin_districts_path, params: { district: district_attrs }
    assert_response :redirect
  end

  test 'should not post create district' do
    district_attrs = attributes_for :district, name: nil

    post admin_districts_path, params: { district: district_attrs }
    assert_response :success

    district = District.find_by(name: district_attrs[:name])
    assert_nil district
  end

  test 'should get edit district page' do
    get edit_admin_district_path(@district.id)
    assert_response :success
  end

  test 'should put update district' do
    attrs = {}
    attrs[:name] = generate :name

    put admin_district_path(@district.id), params: { district: attrs }
    assert_response :redirect

    @district.reload
    assert_equal attrs[:name], @district.name
  end

  test 'should delete destroy district' do
    delete admin_district_path(@district.id)
    assert_response :redirect

    assert_not District.exists?(@district.id)
  end
end
