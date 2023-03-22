class User::PostsController < ApplicationController
    #pathの確認
  def new
    @post=Post.new
  end

  def create
    @post=Post.new(post_params)
    @post.user_id=current_user.id
   if @post.save
    redirect_to posts_path
   else
     render :new #ここはnewでいい？
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
          redirect_to post_path, notice: "アウトプットを編集しました"
      else
          flash.now[:danger] = "編集に失敗しました"
          render 'edit'
      end
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
