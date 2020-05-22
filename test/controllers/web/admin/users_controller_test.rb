# frozen_string_literal: true

require 'test_helper'

class Web::Admin::UsersControllerTest < ActionDispatch::IntegrationTest
  setup do
    @user = create :user
    admin = create :admin
    sign_in_as_admin(admin)
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

  test 'shoud not post create user bad password' do
    city = create :city

    user_attrs = attributes_for(:user, city_id: city.id, password: 'bad')
    post admin_users_path, params: { user: user_attrs }
    assert_response :success

    user = User.find_by(email: user_attrs[:email])
    assert_nil user
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

  test 'should state del user' do
    put admin_user_del_path(@user.id)
    assert_response :redirect
    @user.reload
    assert_equal 'deleted', @user.state
  end

  test 'should state active user' do
    @user.del!
    put admin_user_restore_path(@user.id)
    assert_response :redirect

    @user.reload
    assert_equal 'active', @user.state
  end
end
