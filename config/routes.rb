Rails.application.routes.draw do

  

  resources :products, only: [:index, :show]
  resources :making, only: [:index]



  root to: 'users#show' 
  resources :users, only: [:index, :new]



end
