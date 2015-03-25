class AdminController < ApplicationController
  
  
  # authenticate all requests to controllers in admin namespace
  before_filter :authenticate
  
  protected
  
  def authenticate
    if session[:username] != APP_CONFIG['username']
      redirect_to root_path
    end
  end
    
end
