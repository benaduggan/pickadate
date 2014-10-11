class UsersController < ApplicationController
  
	before_action :signed_in_user, only: [:index, :edit, :update, :show, :destroy, :my_pickadates, :floor_pickadates, :invitations]
	before_action :correct_user, only: [:edit, :update]
  before_action :admin_user, only: :destroy

  def invitations
		@invitations = current_user.user_pickadates.where(:rsvpstatus => nil).all
		@dates = []
		
		@invitations.each do |date|
			@dates.append(date.pickadate)
		end
	end
	
  def my_pickadates
    @dates = current_user.pickadates
  end
	
	def floor_pickadates #Returns the current users floor's pickadates
		@dates = Pickadate.all.where(:floor => current_user.floor) 
	end
  
  def index
    @users = User.paginate(page: params[:page])
  end
  
  def new
    @user = User.new
  end
  
  def create
    @user = User.new(user_params)
    if @user.save then
      sign_in(@user)
      UserMailer.welcome_email(@user)
      flash[:success] = "Welcome #{@user.firstname}"
      redirect_to edit_user_path(@user)
    else
      render 'new'
    end
  end
  
  def show
    @user = User.find(params[:id])
	 gon.user = @user
	  @pickadates = current_user.pickadates #this is the list of your pickadates that you can invite people to
  end
  
  def edit
    @user = User.find(params[:id])
  end
  
  def update
    @user = User.find(params[:id])
    if @user.update_attributes(update_params) then
      flash[:success] = "Successfully updated!"
      redirect_to @user
    else
      render 'edit'
    end
  end
  
  def destroy
    @user = User.find(params[:id])
    if !current_user?(@user) then
      @user.destroy
      flash[:success] = @user.username + " deleted!"
      redirect_to users_path
    else
      flash[:danger] = "You tried to delete yourself you idiot!"
      redirect_to users_path
    end
  end
  
  private
  
    def user_params
      params.require(:user).permit(:firstname, :lastname, :username, :email, :age, :major, :year, :aboutme, :relationshipstatus, :password, :password_confirmation, :hometown, :upload, :floor_id, :gender, :receives_emails)
    end
    
    def update_params
      params.require(:user).permit(:firstname, :lastname, :username, :email, :age, :major, :year, :aboutme, :relationshipstatus, :password, :password_confirmation, :hometown, :upload, :gender, :receives_emails)
    end
    
    def correct_user
      @user = User.find(params[:id])
      redirect_to root_path unless current_user?(@user)
    end
  
end
