Rails.application.routes.draw do

  root to: "homes#top"

  get 'login' => 'sessions#new'
  post 'login' => 'sessions#create'
  delete 'logout' => 'sessions#destroy'

  resource :users, only: [:edit, :update]
  get "signup" => "users#new"
  post 'signup' => "users#create"
  get "mypage" => "users#show", as: "mypage"
  delete "mypage" => "users#destroy", as: "unsubscribe"

  resources :zombies do
    resource :favorites, only: [:create, :destroy]
    resource :reviews, only: [:create, :destroy]
  end

  get "search" => "zombies#search"

  get 'diagnose' => "diagnose#new"
  get 'diagnose/index' => "diagnose#index"
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
