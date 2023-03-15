class User::HomesController < ApplicationController
    #before_action :authenticate_customer!
    
    def top
    @posts=Post.page(params[:page]).per(6)
    end

end
