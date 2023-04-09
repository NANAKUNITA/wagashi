Rails.application.routes.draw do

devise_for :users, skip:[:passwords], controllers:{
    registrations: "user/registrations",
    sessions: 'user/sessions'
  }
  # 以下を追加
  devise_scope :user do
    post 'users/guest_sign_in', to: 'users/sessions#guest_sign_in'
  end
 devise_for :admin, skip:[:registrations, :passwords], controllers:{
    sessions: "admin/sessions"
  }
  
#会員用
    scope module: :user do
    root 'homes#top'
    # 以下を追加
    resources :users, only: [:show, :edit, :update] do
        # マイページのルーティングにネスト
         get :favorites, on: :collection
    end
    get '/post/hashtag/:name', to: "posts#hashtag"
    resources :posts, only: [:show, :index, :create, :new, :update, :edit, :destroy] do #indexは、 root 'homes#top'のため、ここでは指定しない
      resources :comments, only: [:create, :destroy] 
      collection do
          get 'search'
      end
      resource :favorites, only: [:create, :destroy]
      #resourceは、単数形にすると、/:idがURLに含まれなくなる。
    end
    #resourceは、単数形にすると、/:idがURLに含まれなくなる。
    resources :comments, only: [:create, :destroy]
    patch '/users/withdraw' => 'users#withdraw'
    get '/users/confirm_withdraw' => 'users#confirm'
    resources :sweets, only:[:index, :show]
end
  #管理者側
  namespace :admin do
     root 'homes#top'
     resources :posts, only: [:show, :destroy] #do #indexは、 root 'homes#top'のため、ここでは指定しない
        #resources :comments, only: [:create, :destroy] #書き直し！！
     #end
     resources :users, only: [:index, :show]
     resources :sweets, only: [:show, :index, :new, :create, :edit, :update]
     resources :genres, only: [:index, :create, :edit, :update]
end
end
