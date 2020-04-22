# frozen_string_literal: true

require 'test_helper'

class UsersControllerTest < ActionDispatch::IntegrationTest
  setup do
    @user = create :user
  end

  test 'shoud get index users' do
    get users_path
    assert_response :success
  end

  test 'shoud get new user page' do
    get new_user_path
    assert_response :success
  end

  test 'shoud post create user' do
    city = create :city
    city.save
    city.reload

    user_attrs = attributes_for(:user, city_id: city.id)
    post users_path, params: { user: user_attrs }
    assert_response :redirect

    user = User.last
    assert_equal user_attrs[:phone].to_s, user.phone
  end

  test 'shoud get show user page' do
    get user_path(@user.id)
    assert_response :success
  end

  test 'shoud get edit user page' do
    get edit_user_path(@user.id)
    assert_response :success
  end

  test 'shoud put update user' do
    attrs = {}
    attrs['second_name'] = generate :second_name

    put user_path(@user.id), params: { user: attrs }
    assert_response :redirect
    @user.reload

    assert_equal @user.second_name, attrs['second_name']
  end

  test 'shoud destroy user' do
    delete user_path(@user.id)
    assert_response :redirect

    assert_not User.exists?(@user.id)
  end
end
