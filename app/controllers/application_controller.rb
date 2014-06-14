class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery 
  
  helper :users
  
  before_filter :random_user
  
  def random_user
    @random_user = User.all[rand(0..User.all.length-1)] unless User.all.length == 0
  end
  
  private
  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end
  helper_method :current_user
  
  include SessionsHelper
  

  
end
