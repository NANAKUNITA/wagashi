class User::PostsController < ApplicationController
    #pathの確認
 #before_action :authenticate_user!

  def new
    @post = Post.new
    @post.images.build
  end

  def create
    @post = Post.new(post_params)
    if @post.images.present? #photsをimagesに？
      @post.save
      redirect_to root_path
      flash[:notice] = "投稿が保存されました"
    else
      redirect_to root_path
      flash[:alert] = "投稿に失敗しました"
    end
  end

  def index
    @posts = Post.limit(10).order('created_at DESC').page(params[:page]).per(2)
  end

  # ==========ここから追加する==========
  def show
    @post = Post.find_by(id: params[:id])
  end
  # ==========ここまで追加する==========
  def hashtag
  @tag = Tag.find(params[:tag_id])
  @posts = @tag.posts
  end
  
  private
    def post_params
      params.require(:post).permit(:content, photos_attributes: [:image]).merge(user_id: current_user.id)
    end
end
