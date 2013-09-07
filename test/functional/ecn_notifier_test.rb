require 'test_helper'

class EcnNotifierTest < ActionMailer::TestCase
  test "closed" do
    mail = EcnNotifier.closed
    assert_equal "Closed", mail.subject
    assert_equal ["to@example.org"], mail.to
    assert_equal ["from@example.com"], mail.from
    assert_match "Hi", mail.body.encoded
  end

  test "submitted" do
    mail = EcnNotifier.submitted
    assert_equal "Submitted", mail.subject
    assert_equal ["to@example.org"], mail.to
    assert_equal ["from@example.com"], mail.from
    assert_match "Hi", mail.body.encoded
  end

end
