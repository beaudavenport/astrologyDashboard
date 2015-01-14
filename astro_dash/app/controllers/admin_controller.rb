class AdminController < ApplicationController
  
  
  # authenticate all requests to controllers in admin namespace
  before_filter :authenticate
  
  def index
    @orders = Order.all
  end
  
  protected
  
  def authenticate
    authenticate_or_request_with_http_basic do |user, password|
      user == APP_CONFIG['username'] and password == APP_CONFIG['password']
    end
  end
    
end
