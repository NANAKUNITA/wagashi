class User::PostsController < ApplicationController
 before_action :authenticate_user!

  def new
    @post = Post.new
  end

  def create
    @post=Post.new(post_params)
    @post.user_id=current_user.id
    @post.save
    redirect_to post_path
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

  def show
    @post = Post.find(params[:id])
    @comment = Comment.new
    @comments = @post.comments
  end

  #def hashtag
  #@tag = Tag.find(params[:tag_id])
  #@posts = @tag.posts
  #end
  
def new_guest
  # emailでユーザーが見つからなければ作ってくれるという便利なメソッド
  user = User.find_or_create_by(email: 'guest@example.com') do |user|
  # 自分はユーザー登録時にニックネームを必須にしているのでこの記述が必要
  user.name = "ゲスト"
  # 英数字混合を必須にしているので、ランダムパスワードに、英字と数字を追加してバリデーションに引っかからないようにしています。
  user.password = SecureRandom.alphanumeric(10) + [*'a'..'z'].sample(1).join + [*'0'..'9'].sample(1).join
  end
  user.confirmed_at = Time.now
  # sign_inはログイン状態にするデバイスのメソッド、userは3行目の変数userです。
  sign_in user
  # ログイン後root_pathに飛ぶようにしました。
  redirect_to root_path
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
