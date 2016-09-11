Rails.application.routes.draw do
  get 'links/index'

  get 'home/show'

  root 'home#show'
  resources :users, only: [:new, :create]
  resources :links, only: [:index]
end
