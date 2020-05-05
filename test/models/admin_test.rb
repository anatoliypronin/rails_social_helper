require 'test_helper'

class AdminTest < ActiveSupport::TestCase
  test "should create admin" do
    admin = build :admin
    assert admin.save
  end

  test "should not create admin" do
    admin = build :admin, email: nil
    assert_not admin.save
  end

  test 'email should be unique' do
    first_admin = build :admin, email: 'admin@gmail.com'
    first_admin.save
    second_admin = build :admin, email: 'admin@gmail.com'
    assert_not second_admin.save
  end

  test 'email should be valid' do
    admin = build :admin, email: 'good@email.com'
    assert admin.save

    admin = build :admin, email: 'bad@email'
    assert_not admin.save

    admin = build :admin, email: 'bad@email_bad'
    assert_not admin.save

    admin = build :admin, email: 'bad@.ru'
    assert_not admin.save
  end

  test 'should not create incorrect role' do
    admin = build :admin, role: 'any role'
    assert_not admin.save
  end

  test 'should create editor role' do
    admin = build :admin, :editor
    assert_equal 'editor', admin.role
  end
end
