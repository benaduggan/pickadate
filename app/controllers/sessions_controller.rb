class SessionsController < ApplicationController
  
  def new
  end
  
  def create
    
    user = User.from_omniauth(env["omniauth.auth"])
    
    if user.nil? then
       user = User.find_by(email: params[:session][:email]) 
    end
      
    sign_in user
      
    if user.first.nil? then
      user.toggle!(:first)
      redirect_to edit_user_path(user)
    else
      redirect_to root_path
    end
      
  end
  
  def destroy
    session[:user_id] = nil
    redirect_to root_path
  end
  
  
end
