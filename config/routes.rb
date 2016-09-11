Rails.application.routes.draw do
  get 'links/index'

  get 'home/show'

  root 'home#show'
  resources :users, only: [:new, :create, :destroy]
  resources :links, only: [:index]
end
