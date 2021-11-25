Rails.application.routes.draw do
  get 'my_garden/show'
  devise_for :users
  root to: 'pages#home'
  resources :users, only: [:show]
  resources :garden_kits, only: [:show, :index]
  resources :plants, only: [:show]
  resources :my_garden, only: [:show, :create] do
    resources :my_plants, only: [:show, :create]
  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
