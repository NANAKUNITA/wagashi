class User::UsersController < ApplicationController
  before_action :authenticate_user!,except:[:new_guest]
  
  def new_guest
    user = User.find_or_create_by(email: 'guest@example.com') do |user|
      user.password = SecureRandom.urlsafe_base64
      # 必要に応じて、ゲストユーザーに設定したい属性を追加することができます。
    end
    sign_in user
    redirect_to root_path, notice: 'ゲストユーザーとしてログインしました。'
  end
  
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
  
  def confirm
         @user=current_user
  end
     
  def withdraw
   @user=current_user
    if @user.update(is_deleted: true)
      sign_out current_user
    end
   redirect_to root_path
  end
  
   private
     def user_params
         params.require(:user).permit(:is_deleted, :name, :email, :password)
     end

end
