Rails.application.routes.draw do

  root to: 'users#show' 
  resources :users, only: [:index]

  resources :products, only: [:index]

end
