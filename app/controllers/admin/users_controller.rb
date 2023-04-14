class Admin::UsersController < ApplicationController
    #before_action :authenticate_admin!
    
    #顧客一覧画面
    def index
      @users=User.page(params[:page]).per(10)
    end
    
    def show
      @user=User.find(params[:id])
      @users=@user.users
    end
    
    def destroy
    @user = user.find(params[:id])
    @user.destroy
    redirect_to admin_user_path
    end
end
