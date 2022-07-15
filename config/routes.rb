Rails.application.routes.draw do
  
  root to: "homes#top"

  get 'login' => 'sessions#new'
  post 'login' => 'sessions#create'
  delete 'logout' => 'sessions#destroy'
  
  resources :users, only: [:edit, :update]
  get "sign_up" => "users#new"
  post 'sign_up' => "users#create"
  get "mypage/:id" => "users#show", as: "mypage"
  delete "mypage/:id" => "users#destroy", as: "unsubscribe"
  

  resources :zombies
  get "search" => "zombies#search"

  get 'diagnose' => "diagnose#new"
  get 'diagnose/index' => "diagnose#index"
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
