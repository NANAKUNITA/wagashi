class User::FavoritesController < ApplicationController
  before_action :authenticate_user!  
  
  def create
    @post = Post.find(params[:post_id])
#Postモデルからpost_idを探してくる。
    current_user.favorite(@post)
# ログイン中のユーザーと紐づけられたidを取ってくる。この時、user.rbに定義したaliasを使用し、idの情報を保存する。
  end

  def destroy
    @post = current_user.favorites.find(params[:post_id]).post
    current_user.unfavorite(@post)
    # redirect_backはユーザーが直前にリクエストを送ったページに戻す
    # fallback_location: デフォルトの設定
  end
  
  #def create
    #post = Post.find(params[:post_id])
    #favorite = current_user.favorites.new(post_id: post.id)
    #favorite = current_user.favorites.build(post_id: params[:post_id])
    #favorite.save
    #redirect_to post_path(post)
  #end

  #def destroy
    #post = Post.find(params[:post_id])
    #favorite = current_user.favorites.find_by(post_id: post.id)
    #favorite = Favorite.find_by(post_id: params[:post_id], user_id: current_user.id)
    #favorite.destroy
    #redirect_to post_path(post)
  #end
end
