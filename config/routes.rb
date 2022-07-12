Rails.application.routes.draw do

  root to: "homes#top"
  
  resources :zombies, only:[:show, :index]

  get 'diagnose/new' => "diagnose#new"
  get 'diagnose/show' => "diagnose#show"
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
