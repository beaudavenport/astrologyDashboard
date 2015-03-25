require 'test_helper'

class SessionsControllerTest < ActionController::TestCase
  test 'user login submission sets username in session' do 
    user = APP_CONFIG['username']
    pass = APP_CONFIG['password']
    post :create, session: {login: user, password: pass}
    assert_not session[:username].nil?, "username was not set"
  end
  
  test 'delete request removes user from session hash' do
    delete :destroy
    assert session[:username].nil?, "username was not removed"
  end
  
end
