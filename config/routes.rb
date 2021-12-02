Rails.application.routes.draw do

  devise_for :users, :controllers => {:registrations => "registrations"}
  root to: 'pages#home'
  resources :users, only: [:show]
  resources :garden_kits, only: [:show, :index] do
    resources :reviews, only: :create
  end
  resources :plants, only: [:show]
  resources :my_garden, only: [ :create, :update] do
    resources :my_plants, only: [:show, :create]
  end
  resources :my_plants, only: [:update, :show]
  get "user_garden", to: "my_garden#dashboard"
  # user_garden is the name of the route, my_garden is the name of controller, dashboard is the method
  # this line means you need a "dashboard" method in my_garden method
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
