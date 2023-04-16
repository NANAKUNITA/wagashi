class Admin::SweetsController < ApplicationController
    #before_action :authenticate_user!
     
 def index
    @sweets=Sweet.page(params[:page]).per(3) 
    @sweet=Sweet.page(params[:page]).per(12)
 end
     
 def show
    @sweet=Sweet.find(params[:id])
 end
 
  def edit
    @sweet=Sweet.find(params[:id])
  end

  def update
    @sweet=Sweet.find(params[:id])

    if @sweet.update!(sweet_params)
      redirect_to admin_sweet_path(@sweet)
    else
      render "show"
    end
  end
  
  private
  
  def sweet_params
    params.require(:sweet).permit(:genre_id, :name, :description, :image)
  end
end
