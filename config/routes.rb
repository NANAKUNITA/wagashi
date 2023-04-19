Rails.application.routes.draw do

 devise_for :users, skip:[:passwords], controllers:{
    registrations: "user/registrations",
    sessions: "user/sessions"
  }

 devise_for :admin, skip:[:registrations, :passwords], controllers:{
    sessions: "admin/sessions"
  }
#会員用
scope module: :user do
    root to:  "posts#index"
    post '/users/guest_sign_in', to: 'users#new_guest'
    patch "/users/withdraw" => "users#withdraw"
    get "/users/confirm_withdraw" => "users#confirm"
    resources :users, only: [:show, :edit, :update] do
        get :favorites, on: :collection
    end
    #resources :tags, only: [:show] #postsにネストすると、特定の投稿に紐ずくタグを持つ投稿を一覧表示するページにアクセスすることになる。
    #単独ルーティングをすると、特定のタグを持つ投稿を一覧表示するページにアクセスすることになる。
    resources :posts, only: [:index, :show, :create, :new, :update, :edit, :destroy] do #indexは、 root "homes#top"のため、ここでは指定しない
    post :favorites, on: :member
    delete :unfavorites, on: :member
      #resource :favorites, only: [:create, :destroy]
      resources :comments, only: [:create, :destroy] 
      collection do
          get "search"
      end
    end
    resources :sweets, only:[:index, :show]
end
  #管理者側
namespace :admin do
     root to:  "posts#index"
     delete '/posts/:id' => 'posts#destroy', as: 'destroy_post' #ここ消すと、エラーが出る
     resources :posts, only: [:index, :show, :destroy]
     delete '/users/:id' => 'users#destroy', as: 'destroy_user'
     resources :users, only: [:index, :destroy]
     resources :sweets, only: [:show, :index, :edit, :update]
end
end
