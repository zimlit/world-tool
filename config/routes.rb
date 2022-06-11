Rails.application.routes.draw do
  devise_for :users
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  resources :projects
  resources :galaxies

  root "home#index"
  get "/dash", to: "dash#index"
end