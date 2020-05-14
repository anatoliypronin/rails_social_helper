# frozen_string_literal: true

require 'test_helper'

class Web::User::SessionsControllerTest < ActionDispatch::IntegrationTest
  test 'shoud get new session page' do
    get new_user_sessions_path
    assert_response :success
  end

  test 'shoud post create new session for user' do
    user = create :user
    post user_sessions_path, params: { user: { email: user.email, password: user.password } }
    assert_response :redirect
    assert_equal session[:user_id], user.id
  end

  test 'shoud post not create new session for user' do
    user = create :user

    post user_sessions_path, params: { user: { email: user.email, password: 'bad_password' } }

    assert_response :success
    assert_nil session[:user_id]
  end

  test 'shoud destroy user session' do
    user = create :user
    sign_in_as_user(user)

    sign_out_as_user
    assert_response :redirect

    assert_nil session[:user_id]
  end
end
