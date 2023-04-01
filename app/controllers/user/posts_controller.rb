class User::PostsController < ApplicationController
    #pathの確認
  def new
    @post=Post.new
  end

  def create
    @post=Post.new(post_params)
    @post.user_id=current_user.id
   if @post.save
    redirect_to posts_path(@post), notice:'投稿完了しました:)'
   else
     render :new 
   end
  end

 # def index
    #@posts=Post.page(params[:page])
  #end

  def show
    @post=Post.find(params[:id])
    @comment=Comment.new
  end
  
  def edit
      @post=Post.find(params[:id])
  end
  
  def update
      @post=Post.find(params[:id])
      if @post.update(post_params)
         redirect_to post_path(@post.id), notice: "投稿完了しました。"
      else
          flash.now[:danger] = "編集に失敗しました"
          render 'edit'
      end
  end
  
  def hashtag
  @tag = Tag.find(params[:tag_id])
  @posts = @tag.posts
  end

  def destroy
    @post=Post.find(params[:id])
    @post.destroy
    redirect_to posts_path
  end

  private

  def post_params
    params.require(:post).permit(:name, :image, :content)
  end

end
