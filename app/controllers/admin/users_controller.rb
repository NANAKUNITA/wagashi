class Admin::UsersController < ApplicationController
    #before_action :authenticate_admin!
    
    #顧客一覧画面
    def index
        @customers=Customer.page(params[:page]).per(10)
    end
end
