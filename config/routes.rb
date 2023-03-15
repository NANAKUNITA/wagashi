Rails.application.routes.draw do

devise_for :users, skip:[:passwords], controllers:{
    registrations: "user/registrations",
    sessions: 'user/sessions'
  }
 devise_for :admin, skip:[:registrations, :passwords], controllers:{
    sessions: "admin/sessions"
  }
  
  #管理者用
  devise_for :admins
#会員用
  devise_for :users
  get 'homes/top'
    root to: "homes#top"
end
