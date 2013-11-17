class UsersController < ApplicationController
  
  before_action :signed_in_user, only: [:index, :edit, :update, :destroy]
  before_action :correct_user, only: [:edit, :update]
  before_action :admin_user, only: :destroy
  
  def index
    @users = User.paginate(page: params[:page])
  end
  
  def new
    @user = User.new
  end
  
  def create
    @user = User.new(user_params)
    if @user.save then
      sign_in @user
      flash[:success] = "You succesfully created an account!"
      redirect_to @user
    else
      render 'new'
    end
  end
  
  def show
    @user = User.find(params[:id])
  end
  
  def edit
    @user = User.find(params[:id])
  end
  
  def update
    @user = User.find(params[:id])
    if @user.update_attributes(user_params) then
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
      flash[:success] = "User deleted!"
      redirect_to users_path
    else
      flash[:danger] = "You tried to delete yourself you idiot!"
      redirect_to users_path
    end
  end
  
  private
  
    def user_params
      params.require(:user).permit(:name, :email, :password, :password_confirmation )
    end
    
    def admin_user
      redirect_to root_path unless current_user.admin?
    end
    
    def signed_in_user
      unless signed_in?
        redirect_to login_path, notice: "Please sign in."
      end
    end
    
    def correct_user
      @user = User.find(params[:id])
      redirect_to root_path unless current_user?(@user)
    end
  
end
