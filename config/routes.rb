Rails.application.routes.draw do
 devise_for :users, skip:[:passwords], controllers:{
    registrations: "user/registrations",
    sessions: "user/sessions"
  }
  devise_scope :user do
    post "users/guest_sign_in", to: "users/sessions#guest_sign_in"
  end
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
    get "/post/hashtag/:name", to: "posts#hashtag"
    resources :posts, only: [:show, :index, :create, :new, :update, :edit, :destroy] do #indexは、 root "homes#top"のため、ここでは指定しない
      resource :favorites, only: [:create, :destroy]
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
