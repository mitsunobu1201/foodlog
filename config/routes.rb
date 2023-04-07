Rails.application.routes.draw do
# 顧客用
devise_for :users,skip: [:passwords],controllers: {
  registrations: "public/registrations",
  sessions: 'public/sessions'
}

# 管理者用
devise_for :admin, skip: [:registrations, :passwords] ,controllers: {
  sessions: "admin/sessions"
}

#ログアウト時にルートエラーになるため追記
devise_scope :user do
    get '/users/sign_out' => 'devise/sessions#destroy'
  end

root :to => "public/homes#top"
get "about" => "public/homes#about", as: "about"

scope module: 'public' do
  resources :members, only: [:index]
end
get 'member/:member/:year/:month/:day' => 'public/members#show',as: "member"


scope module: 'public' do
  resources :foods, only: [:index,:new,:create,:destroy]
end

scope module: 'public' do
  resources :meals, only: [:new,:create,:destroy]
end

end
