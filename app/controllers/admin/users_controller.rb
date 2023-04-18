class Admin::UsersController < ApplicationController
    before_action :authenticate_admin!
    
    #顧客一覧画面
    def index
      @users=User.page(params[:page]).per(10)
    end
    
    #def show
     # @user=User.find(params[:id])
     # @users=@user.users
    #end
    
    def destroy
    user = User.find(params[:id])
    user.destroy
    flash[:success] = "ユーザーを削除しました"
    redirect_to admin_users_path
    end
    
     private
    def user_params
        params.require(:user).permit(:email, :name, :is_deleted)
    end
end
