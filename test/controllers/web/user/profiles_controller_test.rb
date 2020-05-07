# frozen_string_literal: true

require 'test_helper'

class Web::User::ProfilesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @user = create :user
    sign_in_as_user(@user)
  end

  test 'shoud get edit user/users page' do
    get edit_user_profile_path
    assert_response :success
  end

  test 'shoud put update user/users' do
    attrs = {}
    attrs['second_name'] = generate :second_name

    put user_profile_path, params: { user: attrs }
    assert_response :redirect
    @user.reload

    assert_equal @user.second_name, attrs['second_name']
  end

  test 'shoud not put update other user/users' do
    sign_out_as_user
    attrs = {}
    attrs['second_name'] = generate :second_name
    put user_profile_path, params: { user: attrs }

    assert_not_equal @user.second_name, attrs['second_name']
    assert_response :redirect
  end
end
