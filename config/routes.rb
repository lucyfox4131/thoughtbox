Rails.application.routes.draw do
  root 'home#show'

  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy'

  resources :users, only: [:new, :create, :destroy]
  resources :links, only: [:index]

  namespace :api, defaults: {format: 'json'} do
    namespace :v1 do
      resources :links, only: [:index, :create, :update]
    end
  end
end
