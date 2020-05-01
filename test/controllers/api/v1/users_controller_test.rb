require 'test_helper'

class Api::V1::UsersControllerTest < ActionDispatch::IntegrationTest
  setup do
    @user = create :user
  end

  test 'shoud get users list' do
    get api_v1_users_path
    assert_response :success
  end

  test 'shoud get user info' do
    get api_v1_user_path(@user)
    assert_response :success
    assert_equal response.parsed_body['first_name'], @user.first_name
    assert_equal response.parsed_body['city']['name'], @user.city.name
  end
end