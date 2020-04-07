require 'test_helper'

class AdminTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
  test "should create admin" do
    admin = build :admin
    assert admin.save
  end

  test "should not create admin" do
    admin = build :admin, email: nil
    assert_not admin.save
  end
end
