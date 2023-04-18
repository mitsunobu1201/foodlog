Rails.application.routes.draw do

# 顧客用Devise
devise_for :users,skip: [:passwords],controllers: {
  registrations: "public/registrations",
  sessions: 'public/sessions'
}

# 管理者用Devise
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

#ゲストログイン機能用ルーティング
post '/homes/guest_sign_in', to: 'public/homes#guest_sign_in'

#ユーザー側TOPページ
root :to => "public/homes#top"
get "about" => "public/homes#about", as: "about"

#ユーザー側ルーティング
scope module: 'public' do
  resources :members, only: [:index,:show,:edit,:update]
  resources :meals, only: [:new,:create,:destroy]
  resources :foods, only: [:index,:new,:create,:edit,:update,:destroy]
  resources :comments, only: [:create,:destroy]
  resources :dates, only: [:show]
  resources :nices, only: [:index,:create,:destroy]
  get "search" => "searches#index"
end

#管理者側ルーティング
namespace :admin do
  root :to => "homes#top"
  resources :members, only: [:index,:show,:update]
  resources :foods, only: [:index,:show,:update,:destroy]
  resources :comments, only: [:index,:show,:destroy]
  resources :nices, only: [:index,:destroy]

end

end