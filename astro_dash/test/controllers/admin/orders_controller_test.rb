require 'test_helper'

class Admin::OrdersControllerTest < ActionController::TestCase
  
  # mock dropbox files hash (will be sent from client as JSON) - array of 2 arbitrary files
  file = '[{"name":"filename.txt","link":"https://...","bytes":464,"icon":"https://...","thumbnailLink":"https://...?bounding_box=75&mode=fit"},{"name":"filename2.txt","link":"https://...","bytes":1464,"icon":"https://...","thumbnailLink":"https://...?bounding_box=75&mode=fit"}]'
  
  test "POST request to 'send' should succeed" do
    # send post request with params hash and session hash
    post :send_documents, {:id => 1, :files => file}, {'username' => APP_CONFIG['username']}
    assert_response 200, "POST request failed"
    assert_equal ActiveSupport::JSON.encode(Date.today), @response.body, "POST render incorrect"
  end
    
  test "send_documents action should email customer with document links" do
    
    # Test that ActionMailer deliveries receives new email when post sent
    assert_difference 'ActionMailer::Base.deliveries.size', +1, 'email not delivered' do
      post :send_documents, {:id => 1, :files => file}, {'username' => APP_CONFIG['username']}
    end
    
    newestEmail = ActionMailer::Base.deliveries.last
    
    # Test that subject is correct
    assert_equal newestEmail.subject, 'Your online documents have arrived!'
    
    # Test that email contains necessary details
    assert_equal newestEmail.body.decoded, "boo" 
    
  end
  
  test "send documents action should update filled_on attribute to current date" do
    
    # Test that the order with documents sent has filled_on set to current date
    post :send_documents, {:id => 1, :files => file}, {'username' => APP_CONFIG['username']}
    order = Order.find(1)
    assert !order.filled_on.nil?, 'Order filled_on date is not set'
    assert_equal Date.today, order.filled_on, 'Filled on date is not correct (today)'
  end
  
end
