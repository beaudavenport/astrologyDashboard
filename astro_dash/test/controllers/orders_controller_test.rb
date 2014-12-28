require 'test_helper'

class OrdersControllerTest < ActionController::TestCase
  test "new order path should create new order with id set to service_id parameter" do
    get "new"
    assert_response :success
    assert_not_nil assigns(:order)
    assert_not_nil :order.service_id
  end
end
