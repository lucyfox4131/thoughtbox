Rails.application.routes.draw do
  root 'home#show'

  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  
  resources :users, only: [:new, :create, :destroy]
  resources :links, only: [:index]
end
