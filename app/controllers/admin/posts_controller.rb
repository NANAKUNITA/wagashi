class Admin::PostsController < ApplicationController
  
  def index
    @posts = Post.page(params[:id]).per(10)
  end

  def show
    @post = Post.find(params[:id])
    @comments = @post.comments
  end

  def destroy
    @post = Post.find(params[:id])
    @post.destroy
    redirect_to admin_post_path
  end

end
