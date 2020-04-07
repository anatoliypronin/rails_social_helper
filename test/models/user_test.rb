require 'test_helper'

class UserTest < ActiveSupport::TestCase
  test 'Should create user' do
    user = build :user
    assert user.save
  end

  test 'Should not create user without first_name' do
    user = build :user, first_name: nil
    assert_not user.save
  end

  test 'Should not create user with long first_name' do
    user = build :user, first_name: 'veeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeery long first name'
    assert_not user.save
  end

  test 'Should not create user without second_name' do
    user = build :user, second_name: nil
    assert_not user.save
  end

  test 'Should not create user with long second_name' do
    user = build :user, second_name: 'veeeeeeeeeeeeeeeeeeeeeeeeeeeeeeery long second name'
    assert_not user.save
  end

  test 'Should not create user without email' do
    user = build :user, email: nil
    assert_not user.save
  end

  test 'Should not create user with invalid email format' do
    user = build :user, email: 'wrong@email@format.com'
    assert_not user.save
  end

  test 'Should not create user without password' do
    user = build :user, password: nil
    assert_not user.save
  end

  test 'Should not create user with short password' do
    user = build :user, password: 'qwerty'
    assert_not user.save
  end

  test 'Should not create user without phone' do
    user = build :user, phone: nil
    assert_not user.save
  end

  test 'Should not create user with invalid phone format' do
    user = build :user, phone: '+123+123+123'
    assert_not user.save
  end

  test 'Should not create user with not unique phone' do
    user1 = build :user
    user2 = build :user
    user1.save
    assert_not user2.save
  end

  test 'Should not create user without state' do
    user = build :user, state: nil
    assert_not user.save
  end

  test 'Should not create user with invalid state property' do
    user = build :user, state: 'test'
    assert_not user.save
  end
end
