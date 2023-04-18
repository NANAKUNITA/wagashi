class Admin::SweetsController < ApplicationController
    before_action :authenticate_admin!
     
  def index
    @sweets = Sweet.all.order(created_at: :desc)
    #@sweets=Sweet.page(params[:page]).per(2) 
    #@sweet=Sweet.page(params[:page]).per(12)
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
    params.require(:sweet).permit(:month, :name, :description, :image)
  end
end
