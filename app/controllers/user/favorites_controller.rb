class User::FavoritesController < ApplicationController
   before_action :set_post
   before_action :authenticate_user!

  def create
    current_user.favorite(@post)
    respond_to do |format|
      format.js
    end
  end

  def destroy
    current_user.unfavorite(@post)
    respond_to do |format|
      format.js
    end
  end
  private

  def set_post
    @post = Post.find(params[:id])
  end
end
