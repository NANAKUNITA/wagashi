class User::UsersController < ApplicationController
  before_action :authenticate_user!
  
  def show
    @user=User.find(params[:id])
    @posts=@user.posts
    favorites = Favorite.where(user_id: current_user.id).pluck(:post_id)
    @favorite_list = Post.find(favorites)
  end
  
  def edit
    @user=User.find(params[:id])
  end

  def favorites
    @favorites = current_user.favorites
  end
  
   private
     def user_params
         params.require(:user).permit(:is_deleted, :name, :email, :password)
     end

end
