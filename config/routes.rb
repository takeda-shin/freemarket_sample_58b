Rails.application.routes.draw do

  root to: "making#index"

  resources :products, only: [:index, :show]
  resources :making, only: [:index]



  root to: 'users#show' 

  resources :products, only: [:index]


end
