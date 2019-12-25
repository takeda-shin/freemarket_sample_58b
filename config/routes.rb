Rails.application.routes.draw do
  resources :signup do
    collection do
      get 'index' #登録方法選択
      get 'step1' #会員情報
      get 'step2_1' #電話番号認証
      get 'step2_2'
      get 'step3' #お届け先
      get 'step4' #支払い方法
      get 'finish' #登録完了ページ
      
      get 'login' #ログイン

    end
  end

  

  resources :products, only: [:index, :show]
  resources :making, only: [:index]



  root to: 'users#show' 
  resources :users, only: [:index, :new, :show]
  get 'logout', to: "users#logout" 


end
