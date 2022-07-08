Rails.application.routes.draw do
  devise_for :users
  root to: "recipes#public_recipes"
  
  resources :users
  resources :recipes, only: [:index, :show, :new, :create] do 
    member do
      get :delete
    end
    resources :recipe_food, only: [:new, :create, :destroy]
  end
  resources :inventories
  resources :foods, only: [:index, :new, :create, :destroy]
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
end
