require 'test_helper'

class UserMailerTest < ActionMailer::TestCase
  test 'welcome email for user' do
    user = create :user
    user = user.decorate
    email = UserMailer.welcome_email(user)

    assert_emails 1 do
      email.deliver_now
    end
    assert_equal [user.email], email.to
    assert_equal ['from@example.com'], email.from
    assert_equal "Спасибо за регистрацию, #{user.full_name}!", email.subject
  end
end
