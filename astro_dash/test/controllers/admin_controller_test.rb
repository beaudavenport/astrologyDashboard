require 'test_helper'

class AdminControllerTest < ActionController::TestCase
  test "should get index" do 
    get :index
    assert_response :success
  end
  
  test "should get config variables" do
    assert_equal "foo", APP_CONFIG['username']
    assert_equal "bar", APP_CONFIG['password']
  end
end
