module SessionsHelper
  
  def sign_in(user)
    session[:user_id] = user.id
    remember_token = User.new_remember_token
    cookies.permanent[:remember_token] = remember_token
    user.update_attribute(:remember_token, User.encrypt(remember_token))
    self.current_user = user
  end
  
  def signed_in?
    !current_user.nil?
  end
  
  def sign_out
    self.current_user = nil
    cookies.delete(:remember_token)
  end
  
  def current_user=(user)
    @current_user = user
  end
  

  #def current_user #this is commented out because it conflicts with the one in the application controller - causes CSRF attack
    #remember_token = User.encrypt(cookies[:remember_token])
    #@current_user ||= User.find_by(remember_token: remember_token)
  #end

  
  def current_user?(user)
    user == current_user
  end
  
  def signed_in_user
    unless signed_in?
      redirect_to login_path, :flash => { :info => "Please sign in." }
    end
  end
	
	def admin_user
      redirect_to root_path unless current_user.admin?
  end
  
end
