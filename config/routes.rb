Rails.application.routes.draw do

devise_for :users, skip:[:passwords], controllers:{
    registrations: "user/registrations",
    sessions: 'user/sessions'
  }
 devise_for :admin, skip:[:registrations, :passwords], controllers:{
    sessions: "admin/sessions"
  }
  
#会員用
    scope module: :user do
    root 'homes#top'
    resources :users, only: [:index, :show]
    resources :posts, only: [:show, :create, :new, :update, :edit, :destroy] #indexは、 root 'homes#top'のため、ここでは指定しない
    patch '/users/withdraw' => 'users#withdraw'
    get '/users/confirm_withdraw' => 'users#confirm'
    resources :users, only:[:show, :edit, :update]
    resources :sweets, only:[:index, :show]
end
end
