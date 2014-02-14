require 'test_helper'

class TreqNotifierTest < ActionMailer::TestCase
  test "new_treq" do
    mail = TreqNotifier.new_treq
    assert_equal "New treq", mail.subject
    assert_equal ["to@example.org"], mail.to
    assert_equal ["from@example.com"], mail.from
    assert_match "Hi", mail.body.encoded
  end

end
