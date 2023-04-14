class User::SweetsController < ApplicationController
     #before_action :authenticate_user!
     
     def index
        @sweets=Sweet.page(params[:page]).per(2) 
     end
     
     def show
        @sweet=Sweet.find(params[:id])
     end
end
