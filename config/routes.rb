Rails.application.routes.draw do
  devise_for :users
  root to: "users#index"
  
  resources :users
  resources :recipes
  resources :inventories
  resources :foods, only: [:index, :create, :destroy]
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
end
