# frozen_string_literal: true

require 'test_helper'

class Web::User::UsersControllerTest < ActionDispatch::IntegrationTest
  setup do
    @user = create :user
    sign_in_as_user(@user)
  end

  test 'shoud get index user/users' do
    get users_path
    assert_response :success
  end

  test 'shoud get new user/users page' do
    get new_user_path
    assert_response :success
  end

  test 'shoud post create user/users' do
    city = create :city

    user_attrs = attributes_for(:user, city_id: city.id)
    post users_path, params: { user: user_attrs }
    assert_response :redirect

    user = User.last
    assert_equal user_attrs[:phone], user.phone
  end

  test 'shoud get show user/users page' do
    get user_path(@user.id)
    assert_response :success
  end

  test 'shoud get edit user/users page' do
    get edit_user_path(@user.id)
    assert_response :success
  end

  test 'shoud not get edit other user/users page' do
    user = create :user
    get edit_user_path(user.id)
    assert_redirected_to users_path
  end

  test 'shoud put update user/users' do
    attrs = {}
    attrs['second_name'] = generate :second_name

    put user_path(@user.id), params: { user: attrs }
    assert_response :redirect
    @user.reload

    assert_equal @user.second_name, attrs['second_name']
  end

  test 'shoud not put update other user/users' do
    user = create :user
    attrs = {}
    attrs['second_name'] = generate :second_name

    put user_path(user.id), params: { user: attrs }
    assert_redirected_to users_path
  end
end
