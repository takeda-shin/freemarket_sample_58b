Rails.application.routes.draw do

  get 'category/category_list'
  get 'category/character-goods'
  devise_for :users, controllers: {
    registrations: 'signup',
    sessions: 'users/sessions',
    omniauth_callbacks: 'users/omniauth_callbacks'
  }
  
  devise_scope :user do
    get "sign_in", :to => "users/sessions#new"
    get "sign_out", :to => "users/sessions#destroy" 
  end

  resources :signup do
    collection do
      get 'index' #登録方法選択
      get 'step1' #会員情報
      get 'step2_1' #電話番号認証
      post 'step2_1' => 'signup#sms_post'
      get 'step2_2'
      post 'step2_2' => 'signup#sms_check'
      post 'step3' #お届け先
      post 'step4' #支払い方法
      get 'finish' #登録完了ページ
    end
  end

  resources :products, only: [:index, :new, :create, :update, :show, :destroy] do
    member do
      get 'details'
    
    resources :making, only: [:index]
    end
  end

  resources :users, only: [:index, :new, :show, :edit] do
    collection do
      get 'identification'
    end
  end

  get 'making/buy' => 'making#buy'
  resources :users, only: [:index, :new, :show, :edit]

  root to: 'products#index'
  resources :category, only: [:category_list]
  resources :exhibition, only: [:index]

  resources :card_infos do
    member do
      get 'show', to: 'card_infos#show'
      post 'purchase', to: 'card_infos#purchase'
      get 'done', to: 'card_infos#done'
    end
  end

end