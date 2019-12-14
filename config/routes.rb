Rails.application.routes.draw do

  root to: 'users#show' 

  resources :products, only: [:index]

end
