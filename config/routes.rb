Rails.application.routes.draw do
  get '/general_shopping_list', to: 'shopping_list#index'
  resources :recipes
  resources :inventories
  resources :foods, only: [:index, :create, :destroy]
  devise_for :users
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
