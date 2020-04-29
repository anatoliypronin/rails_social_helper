# frozen_string_literal: true

require 'test_helper'

class Admin::UsersControllerTest < ActionDispatch::IntegrationTest
  setup do
    @user = create :user
  end

  test 'shoud get index users' do
    get admin_users_path
    assert_response :success
  end

  test 'shoud get new user page' do
    get new_admin_user_path
    assert_response :success
  end

  test 'shoud post create user' do
    city = create :city

    user_attrs = attributes_for(:user, city_id: city.id)
    post admin_users_path, params: { user: user_attrs }
    assert_response :redirect

    user = User.last
    assert_equal user_attrs[:phone], user.phone
  end

  test 'shoud get show user page' do
    get admin_user_path(@user.id)
    assert_response :success
  end

  test 'shoud get edit user page' do
    get edit_admin_user_path(@user.id)
    assert_response :success
  end

  test 'shoud put update user' do
    attrs = {}
    attrs['second_name'] = generate :second_name

    put admin_user_path(@user.id), params: { user: attrs }
    assert_response :redirect
    @user.reload

    assert_equal @user.second_name, attrs['second_name']
  end

  test 'shoud destroy user' do
    delete admin_user_path(@user.id)
    assert_response :redirect

    assert_not User.exists?(@user.id)
  end
end
