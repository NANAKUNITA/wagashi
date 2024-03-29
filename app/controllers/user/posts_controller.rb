class User::PostsController < ApplicationController
 before_action :authenticate_user!

  def new
    @post = Post.new
  end
  
  def edit
    @post = Post.find(params[:id])
  end
  
  def update
    @post = Post.find(params[:id])
    @post.update(post_params)
    redirect_to post_path #useres/showへ
  end

  def create
    @post=Post.new(post_params)
    @post.user_id=current_user.id
    @post.save
    redirect_to posts_path
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
  
  #def hashtag
    #@user = current_user
    #@tag = Hashtag.find_by(hashname: params[:name])
    #@posts = @tag.posts
  #end

  def show
    @post = Post.find(params[:id])
    @comment = Comment.new
    @comments = @post.comments
  end

  def favorites
    @post = current_user.favorite_posts.includes(:user).order(created_at: :desc)
  end
  
  def destroy
   @post = Post.find(params[:id])
   @post.destroy
   redirect_to posts_path
  end

  private
    def post_params
      params.require(:post).permit(:title, :content, :image)
    end
end
