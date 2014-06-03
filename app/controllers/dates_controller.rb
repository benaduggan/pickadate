class DatesController < ApplicationController

  def index
    @dates = Date.all
  end
  
end
