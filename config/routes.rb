Rails.application.routes.draw do
  root to: "piscines#index"

  # get 'piscines/show'
  get 'piscines/index_perso'
  # get 'piscines/create'
  # get 'piscines/new'
  # get 'users/show'
  # get 'users/index'
  # get 'users/create'
  # get 'users/new'
  devise_for :admins
  devise_for :users

  resources :piscines, only: [:index, :show, :new, :create]
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
