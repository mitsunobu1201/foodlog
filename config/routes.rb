Rails.application.routes.draw do
# 顧客用
devise_for :users,skip: [:passwords],controllers: {
  registrations: "public/registrations",
  sessions: 'public/sessions'
}

# 管理者用
devise_for :admin, skip: [:passwords] ,controllers: {
  registrations: "admin/registrations",
  sessions: "admin/sessions"
}

#ログアウト時にルートエラーになるため追記
devise_scope :user do
    get '/users/sign_out' => 'devise/sessions#destroy'
  end
devise_scope :admin do
    get '/admin/sign_out' => 'devise/sessions#destroy'
  end


root :to => "public/homes#top"
get "about" => "public/homes#about", as: "about"

scope module: 'public' do
  resources :members, only: [:index,:show,:edit,:update]
  resources :meals, only: [:new,:create,:destroy]
  resources :foods, only: [:index,:new,:create,:edit,:update,:destroy]
  resources :comments, only: [:create,:destroy]
  resources :dates, only: [:show]
  resources :nices, only: [:index,:create,:destroy]
end

namespace :admin do
  get '/' => 'homes#top'
  resources :members, only: [:index,:show,:update]
  resources :foods, only: [:index,:show,:update,:destroy]
  resources :comments, only: [:index,:show,:destroy]
  resources :nices, only: [:index,:destroy]
end

end
