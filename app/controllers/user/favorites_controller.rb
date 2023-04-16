class User::FavoritesController < ApplicationController
   #before_action :set_post

  def create
    @favorite = Favorite.new(user_id: current_user.id, post_id: @post.id)
    @favorite.save
    redirect_to post_path(@post)
  end

  def destroy
    @favorite = Favorite.find_by(user_id: current_user.id, post_id: @post.id)
    @favorite.destroy
    redirect_to post_path(@post)
  end

  private

  def set_post
    @post = Post.find(params[:post_id])
  end
end
