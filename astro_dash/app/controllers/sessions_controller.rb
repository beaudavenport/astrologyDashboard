class SessionsController < ApplicationController
  def new
  end
  
  def create
    login_id = params[:session][:login]
    login_pass = params[:session][:password]
    
    # if valid login, set session username
    if login_id == APP_CONFIG['username'] and login_pass == APP_CONFIG['password']
      session[:username] = login_id
      redirect_to admin_index_path
    else
      flash[:danger] = 'invalid login'
      render 'new'
    end
  end

  def destroy
    # username is only session variable, so simply reset entire session
    reset_session
    redirect_to root_path
  end
end
