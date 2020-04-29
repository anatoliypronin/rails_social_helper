# frozen_string_literal: true

require 'test_helper'

class User::UsersControllerTest < ActionDispatch::IntegrationTest
  setup do
    @user = create :user
    sign_in_as_user(@user)
  end

  test 'shoud get index user/users' do
    get user_users_path
    assert_response :success
  end

  test 'shoud get new user/users page' do
    get new_user_user_path
    assert_response :success
  end

  test 'shoud post create user/users' do
    city = create :city

    user_attrs = attributes_for(:user, city_id: city.id)
    post user_users_path, params: { user: user_attrs }
    assert_response :redirect

    user = User.last
    assert_equal user_attrs[:phone], user.phone
  end

  test 'shoud get show user/users page' do
    get user_user_path(@user.id)
    assert_response :success
  end

  test 'shoud get edit user/users page' do
    get edit_user_user_path(@user.id)
    assert_response :success
  end

  test 'shoud not get edit user/users page without permissions' do
    user = create :user
    get edit_user_user_path(user.id)
    assert_response :redirect
  end

  test 'shoud put update user/users' do
    attrs = {}
    attrs['second_name'] = generate :second_name

    put user_user_path(@user.id), params: { user: attrs }
    assert_response :redirect
    @user.reload

    assert_equal @user.second_name, attrs['second_name']
  end

  test 'shoud destroy user/users' do
    delete user_user_path(@user.id)
    assert_response :redirect

    assert_not User.exists?(@user.id)
  end
end
