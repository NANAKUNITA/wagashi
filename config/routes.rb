Rails.application.routes.draw do
 post 'login/guest', to: 'sessions#new_guest'
 
 devise_for :users, skip:[:passwords], controllers:{
    registrations: "user/registrations",
    sessions: "user/sessions"
  }

 devise_for :admin, skip:[:registrations, :passwords], controllers:{
    sessions: "admin/sessions"
  }
#会員用
    scope module: :user do
    root "homes#top"
    # 以下を追加
    resources :users, only: [:show, :edit, :update] do
        get :favorites, on: :collection
    end
    resources :tags, only: [:show] #postsにネストすると、特定の投稿に紐ずくタグを持つ投稿を一覧表示するページにアクセスすることになる。
    #単独ルーティングをすると、特定のタグを持つ投稿を一覧表示するページにアクセスすることになる。
    resources :posts, only: [:show, :index, :create, :new, :update, :edit, :destroy] do #indexは、 root "homes#top"のため、ここでは指定しない
    post 'favorites', to: 'favorites#create'
    delete 'favorites', to: 'favorites#destroy'
      #resource :favorites, only: [:create, :destroy]
      resources :comments, only: [:create, :destroy] 
      collection do
          get "search"
      end
    end
    patch "/users/withdraw" => "users#withdraw"
    get "/users/confirm_withdraw" => "users#confirm"
    resources :sweets, only:[:index, :show]
end
  #管理者側
  namespace :admin do
     root "homes#top"
     #delete "/posts/:id" => "posts#destroy_post"
     resources :posts, only: [:index, :show, :destroy]  #indexは、 root "homes#top"のため、ここでは指定しない
     resources :users, only: [:index, :show, :destroy]
     resources :sweets, only: [:show, :index, :new, :create, :edit, :update]
end
end
