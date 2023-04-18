class User::SweetsController < ApplicationController
     before_action :authenticate_user!
     
     def index
          @sweets = Sweet.all.order(created_at: :desc)
        #@sweets=Sweet.page(params[:page]).per(2) 
        #@sweet=Sweet.page(params[:page]).per(12)
     end
     
     def show
        @sweet=Sweet.find(params[:id])
     end
     
       private
     
     def sweet_params
         params.require(:sweet).permit(:month, :name, :description, :image)
     end
end
