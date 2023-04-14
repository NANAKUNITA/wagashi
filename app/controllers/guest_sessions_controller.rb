class GuestSessionsController < ApplicationController
    skip_before_action :login_required
    
    def create
        user = User.find_by(name: 'ゲスト', email: 'guest@mail')
        lig_in(user)
        flash[:success] = 'ゲストユーザーでログインしました'
        redirect_to posts_path(user)
    end
end
