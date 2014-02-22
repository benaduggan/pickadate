class SessionsController < ApplicationController
  
  def new
  end
  
  def create
    user = User.from_omniauth(env["omniauth.auth"])
    session[:user_id] = user.id
    if user.first then
      user.first = false
      user.save
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
