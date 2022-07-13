Rails.application.routes.draw do

  root to: "homes#top"

  resources :zombies

  get 'diagnose' => "diagnose#new"
  get 'diagnose/index' => "diagnose#index"
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
