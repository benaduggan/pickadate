class PickadatesController < ApplicationController

  def index
    @pickadates = Pickadate.all
  end
  
  def new
    @date = Pickadate.new
  end
  
  def create
    @date = Pickadate.new(date_params)
    @date.owner = (@current_user ||= User.find(session[:user_id]) if session[:user_id]).id
    if @date.save then
      flash[:success] = "You succesfully created a date!"
      redirect_to pickadate_path(@date)
    else
      render 'new'
    end
  end
  
  def show
    @date = Pickadate.find(params[:id])
    @owner = User.find_by(@date.owner)
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
      params.require(:pickadate).permit(:title, :time, :description, :rating, :rsvp_status, :floor, :location )
    end  
   
    def update_params
      params.require(:pickadate).permit(:title, :time, :description, :rating, :rsvp_status, :floor, :location )
    end 
   
end
