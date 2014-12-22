class PickadatesController < ApplicationController
  respond_to :html, :js
	before_action :signed_in_user
	before_action :ensure_current_user_is__correct_pa_or_admin, only: [:edit, :update, :destroy, :payment] #PA's can only edit the dates they created... also Admin rule!
	before_action :ensure_current_user_is_pa, only: [:new,:create] #Only PA's can make dates!
	
	def payment
		@user_pickadate = Pickadate.find_by_id(params[:id]).user_pickadates.where(user_type: "host").where(rsvpstatus: "yes")[0]
		@user_pickadates = Pickadate.find_by_id(params[:id]).user_pickadates.where(user_type: "host").where(rsvpstatus: "yes")
		
	end
	
	def paymentsubmit
		
	end
	
	def invite_user
    @inviteduser = User.find_by_id(params[:user_id])
		@inviteduser.pickadate_ids = @inviteduser.pickadate_ids.append(params[:id])
		@inviteduser.save!
    
    UserMailer.invite_user(@inviteduser).deliver!
		
		@user_pickadate = @inviteduser.user_pickadates.where(pickadate_id: params[:id]).first
		@user_pickadate.invited_by = current_user.id
		@user_pickadate.user_type = "guest"
		
		if @user_pickadate.save
			respond_to do |format|
				format.js { render :json => "Success!" }
			end
		else
			flash[:danger] = "There was an error in the rsvpstatus... the userpickadate could not be saved... i think..."
			redirect_to home_path
		end
	end
  
	def rsvpstatus
		@user_pickadate = current_user.user_pickadates.where(pickadate_id: params[:id]).first
		@user_pickadate.rsvpstatus = params[:rsvpstatus]
		puts "im here"
		if @user_pickadate.save
			if @user_pickadate.rsvpstatus == "no"
					@user_pickadate.destroy
			end
			respond_to do |format|
				format.js { render :json => "Success!" }
			end
		else
			flash[:danger] = "There was an error in the rsvpstatus... the userpickadate could not be saved i think"
			redirect_to home_path
		end
	end
    
  def index
    @dates = Pickadate.all.sort_by &:time
  end
  
  def new
    @date = Pickadate.new
  end
  
  def create
    @date = Pickadate.new(date_params)
    @date.creator = current_user.id
    @date.floor = current_user.floor
    
    #associate all of the floor of the creator of the pickadate to the pickadate?
    @date.users = @date.floor.users.all #I haven't tested this at all, just thought it might work...
    
    
    if @date.save then
      flash[:success] = "You succesfully created a date!"
      redirect_to pickadate_path(@date)
    else
      render 'new'
    end
  end
  
  def show
    @date = Pickadate.find(params[:id])
    gon.date = @date
	   
    if current_user.user_pickadates.where(pickadate_id: params[:id]).length == 1
      gon.currentrsvpstatus = current_user.user_pickadates.where(pickadate_id: params[:id]).first.rsvpstatus
    end
    @creator = User.find_by(@date.creator)
	 
	 if current_user.gender = "Male"
		 @users = User.all.where(gender: 'Female')
	 else
		 @users = User.all.where(gender: 'Male')
	 end
  end
  
  def edit
    @date = Pickadate.find(params[:id])
  end
  
  def update
    @date = Pickadate.find(params[:id])
    if @date.update_attributes(update_params) then
      flash[:success] = "Successfully updated!"
      redirect_to @date
    else
      render 'edit'
    end
  end
  
  def destroy
    @date = Pickadate.find(params[:id])
    if @date then
      @date.destroy
      flash[:success] = @date.title + " deleted!"
      redirect_to pickadates_path
    else
      flash[:danger] = "You cannot delete this date!"
      redirect_to pickadates_path
    end
  end

 private
		def ensure_current_user_is_pa
			redirect_to root_path unless current_user.pa?
		end
		
		def ensure_current_user_is__correct_pa_or_admin
			@date = Pickadate.find(params[:id])	
			redirect_to root_path unless ((current_user.id == @date.creator) or current_user.admin?)
			return true
		end
		
    def date_params
      params.require(:pickadate).permit(:title, :time, :description, :location, :cost )
    end  
   
    def update_params
      params.require(:pickadate).permit(:title, :time, :description, :location, :cost )
    end 
   
end
