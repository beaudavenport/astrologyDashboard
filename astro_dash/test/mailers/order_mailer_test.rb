require 'test_helper'

class OrderMailerTest < ActionMailer::TestCase
  test 'send confirmation email' do
    # Send order confirmation email and check that it got queued
    order = Order.last
    email = OrderMailer.confirmation_email(order).deliver
    assert_not ActionMailer::Base.deliveries.empty?
    
    assert_equal ['from@example.com'], email.from
    assert_equal ['beau@beau.com'], email.to
    assert_equal 'Thank you for your order!', email.subject
  end
end
