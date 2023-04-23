class User::PostsController < ApplicationController
 before_action :authenticate_user!

  def new
    @post = Post.new
    @tag_list = @post.tags.pluck(:name).join(',')
  end
  
  def edit
    @post = Post.find(params[:id])
  end
  
  def update
    @post = Post.find(params[:id])
    tag_list=params[:post][:name].split(',')
    @post.update(post_params)
    redirect_to post_path #useres/showへ
  end

  def create
    @post=Post.new(post_params)
    @post.user_id=current_user.id
    tag_list=params[:post][:name].split(',')
    @post.save
    redirect_to posts_path
  end

  def index
    @posts = Post.page(params[:id]).per(10)
    @tag_list=Tag.all
  end
  
  def search
    if params[:keyword].present?
      @posts = Post.where('content LIKE ?', "%#{params[:keyword]}%")
      @keyword = params[:keyword]
    else
      @posts = Post.all
    end
  end

  def show
    @post = Post.find(params[:id])
    @comment = Comment.new
    @comments = @post.comments
    @post_tags = @post.tags
  end

  #def hashtag
  #@tag = Tag.find(params[:tag_id])
  #@posts = @tag.posts
  #end
  

  def favorites
    @post = current_user.favorite_posts.includes(:user).order(created_at: :desc)
  end
  
  def destroy
   @post = Post.find(params[:id])
   @post.destroy
   redirect_to posts_path
  end
  
  def search_tag
    #検索結果画面でもタグ一覧表示
    @tag_list=Tag.all
#検索されたタグを受け取る
    @tag=Tag.find(params[:tag_id])
#検索されたタグに紐づく投稿を表示
    @posts=@tag.posts.page(params[:page]).per(10)
  end

  private
    def post_params
      params.require(:post).permit(:title, :content, :image)
    end
end
