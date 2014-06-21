class PickadatesController < ApplicationController
  respond_to :html, :js
  
  
  def rsvpstatus
    @user_pickadate = current_user.user_pickadates.where(pickadate_id: params[:id]).first
    puts @user_pickadate.rsvpstatus
    puts params
    @user_pickadate.rsvpstatus = params[:rsvpstatus]
    @user_pickadate.save

    respond_to do |format|
      format.js { render :json => "Success!" }
    end
  end
    
  
  def index
    @pickadates = Pickadate.all.sort_by &:time
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
    def date_params
      params.require(:pickadate).permit(:title, :time, :description, :location )
    end  
   
    def update_params
      params.require(:pickadate).permit(:title, :time, :description, :location )
    end 
   
end
