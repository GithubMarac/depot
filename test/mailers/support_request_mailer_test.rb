require 'test_helper'

class SupportRequestMailerTest < ActionMailer::TestCase
  test "respond" do
    mail = SupportRequestMailer.respond(support_requests(:one))
    assert_equal "Re: Respond", mail.subject
    assert_equal ["depot@example.com"], mail.from
  end

end
