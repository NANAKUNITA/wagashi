class User::UsersController < ApplicationController
  def show
    @user=User.find(params[:id])
    @posts=@user.posts.page(params[:page])
  end

end
