Rails.application.routes.draw do
  root to: "views#index"

  resources :views, only: [:index, :show]
end
