# frozen_string_literal: true

require 'test_helper'

class Web::Admin::SessionsControllerTest < ActionDispatch::IntegrationTest
  test 'shoud get new session page' do
    get new_admin_sessions_path
    assert_response :success
  end

  test 'shoud post create new session for admin' do
    admin = create :admin
    post admin_sessions_path, params: { admin: { email: admin.email, password: admin.password } }
    assert_response :redirect
    assert_equal session[:admin_id], admin.id
  end

  test 'shoud post not create new session for admin' do
    admin = create :admin

    post admin_sessions_path, params: { admin: { email: admin.email, password: 'bad_password' } }

    assert_response :success
    assert_nil session[:admin_id]
  end

  test 'shoud destroy admin session' do
    admin = create :admin
    sign_in_as_admin(admin)

    delete admin_sessions_path
    assert_response :redirect

    assert_nil session[:admin_id]
  end
end
