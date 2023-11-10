Rails.application.routes.draw do
  root to: "piscines#index"

  get 'piscines/show'
  get 'piscines/index'
  get 'piscines/create'
  get 'piscines/new'
  get 'users/show'
  get 'users/index'
  get 'users/create'
  get 'users/new'
  devise_for :admins
  devise_for :users
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end