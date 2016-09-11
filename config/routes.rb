Rails.application.routes.draw do
  get 'home/show'

  root 'home#show'
  resources :users, only: [:new]
end
