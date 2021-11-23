Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  resources :users, only: [:show]
  resources :garden_kits, only: [:show, :index]
  resources :plants, only: [:show]
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
