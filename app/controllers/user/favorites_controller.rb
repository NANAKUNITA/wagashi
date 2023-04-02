class User::FavoritesController < ApplicationController
  def create
    post = Post.find(params[:post_id])
    #favorite = current_user.favorites.new(post_id: post.id)
    favorite = current_user.favorites.build(post_id: params[:post_id])
    favorite.save
    redirect_to post_path(post)
  end

  def destroy
    post = Post.find(params[:post_id])
    #favorite = current_user.favorites.find_by(post_id: post.id)
    favorite = Favorite.find_by(post_id: params[:post_id], user_id: current_user.id)
    favorite.destroy
    redirect_to post_path(post)
  end
end
