class User::PostsController < ApplicationController
    #pathの確認
 #before_action :authenticate_user!

  def new
    @post = Post.new
  end

  def create
    @post = Post.new(post_params)
    if @post.image.present? 
      @post.save
      redirect_to root_path
      flash[:notice] = "投稿が保存されました"
    else
      redirect_to root_path
      flash[:alert] = "投稿に失敗しました"
    end
  end

  def index
    @posts = Post.page(params[:id]).per(10)
  end
  
  def search
    if params[:keyword].present?
      @posts = Post.where('content LIKE ?', "%#{params[:keyword]}%")
      @keyword = params[:keyword]
    else
      @posts = Post.all
    end
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
      params.require(:post).permit(:title, :content, :image)
    end
end
