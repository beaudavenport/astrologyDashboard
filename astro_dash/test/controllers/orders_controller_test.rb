require 'test_helper'

class OrdersControllerTest < ActionController::TestCase
  test "new order path should create new order with id set to service_id parameter" do
    get "new"
    assert_response :success
    assert_not_nil assigns(:order)
    assert_not_nil :order.service_id
  end
  
  test 'A new order should trigger confirmation email' do
    
    # Test that ActionMailer deliveries receives new email when post sent
    assert_difference 'ActionMailer::Base.deliveries.size', +1, 'email not delivered' do
      post :create, order: {email: 'beau@beau.com', 
      customer: 'beau davenport',
      customer_info: '2/24/1988, St. Louis, MO 3:40',
      session_id: 1}
    end
    
    test_confirmation_email = ActionMailer::Base.deliveries.last

    assert_equal 'Thank you for your order!', test_confirmation_email.subject, 'Subject mismatch'
    assert_equal 'beau@beau.com', test_confirmation_email.to[0], 'to address mismatch'
    assert_equal 'from@example.com', test_confirmation_email.from[0], 'from address mismatch'

  end
end
