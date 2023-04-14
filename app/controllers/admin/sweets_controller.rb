class Admin::SweetsController < ApplicationController
    #before_action :authenticate_user!
     
 def index
    @sweets=Sweet.page(params[:page]).per(12) 
    @sweet=Sweet.page(params[:page]).per(3)
 end
     
 def show
    @sweet=Sweet.find(params[:id])
 end
 
 def edit
     
 end
end
