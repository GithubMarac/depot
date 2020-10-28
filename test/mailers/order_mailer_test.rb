require 'test_helper'

class OrderMailerTest < ActionMailer::TestCase
  test "received" do
    mail = OrderMailer.received(orders(:one))
    assert_equal ["mario.probst2@gmail.com"], mail.to
    assert_equal ["depot@example.com"], mail.from
    assert_match "Programing Ruby 1.9", mail.body.encoded
  end

  test "shipped" do
    mail = OrderMailer.shipped(orders(:one))
    assert_equal "Pragmatic Store Order Shipped", mail.subject
    assert_equal ["mario.probst2@gmail.com"], mail.to
    assert_equal ["depot@example.com"], mail.from
    assert_match "Pragmatic Store", mail.encoded
  end

end
