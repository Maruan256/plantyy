Rails.application.routes.draw do

  devise_for :users, :controllers => {:registrations => "registrations"}
  root to: 'pages#home'
  resources :users, only: [:show]
  resources :garden_kits, only: [:show, :index]
  resources :plants, only: [:show]
  resources :my_garden, only: [ :create, :update] do
    resources :my_plants, only: [:show, :create, :update]
  end
  get "user_garden", to: "my_garden#dashboard"
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
