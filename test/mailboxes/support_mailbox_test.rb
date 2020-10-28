require "test_helper"

class SupportMailboxTest < ActionMailbox::TestCase
  # test "receive mail" do
  #   receive_inbound_email_from_mail \
  #     to: '"someone" <someone@example.com>',
  #     from: '"else" <else@example.com>',
  #     subject: "Hello world!",
  #     body: "Hello?"
  # end
  #fixturesfixtures


  test "we create a support request when we get a support mail" do
    receive_inbound_email_from_mail(
        to: "support@example.com",
        from: "chriss@gmail.com",
        subject: "Need help",
        body: "I can't figure out"
    )

    support_request = SupportRequest.last
    assert_equal "chriss@gmail.com", support_request.email
    assert_equal "Need help", support_request.subject
    assert_nil support_request.order
  end
end
