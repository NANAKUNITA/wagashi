class Admin::PostsController < ApplicationController
  before_action :authenticate_admin!

  def index
    @posts = Post.page(params[:id]).per(10)
  end

  def show
    @post = Post.find(params[:id])
    @comments = @post.comments
  end

  def destroy
    post = Post.find(params[:id])
    post.destroy
    redirect_to admin_posts_path, notice: '投稿を削除しました。'
  end
  
   private
    def user_params
        params.require(:user).permit(:email, :name, :is_deleted)
    end

end
