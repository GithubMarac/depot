require 'test_helper'

class OrderMailerTest < ActionMailer::TestCase
  test "received" do
    mail = OrderMailer.received
    assert_equal ["mario.probst2@gmail.com"], mail.to
    assert_equal ["depot@example-com"], mail.from
    assert_match "/1 x Programing Ruby 1.9/", mail.body.encoded
  end

  test "shipped" do
    mail = OrderMailer.shipped
    assert_equal "Pragmatic Store Order Shipped", mail.subject
    assert_equal ["mario.probst2@gmail.org"], mail.to
    assert_equal ["depot@example.com"], mail.from
    assert_match /<td[^>]*>1<\/td>\s*<td>Programming Ruby 1.9<\/td>/, mail.body.encoded
  end

end
