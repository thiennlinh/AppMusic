require 'test_helper'

class UserMailerTest < ActionMailer::TestCase
  test "password_reset" do
    mail = UserMailer.password_reset
    user.reset_token = User.new_token
    assert_equal "Password reset", mail.subject
    assert_equal ["to@example.org"], mail.to
    assert_equal ["from@example.com"], mail.from
    assert_match "Hi", mail.body.encoded
  end

end
