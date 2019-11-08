Rails.application.routes.draw do
  devise_for :users, :controllers => {
    :registrations => 'users/registrations',
    :sessions => 'users/sessions'   
  } 

  devise_scope :user do
    get "sign_in", to: "users/sessions#new"
    get "sign_out", to: "users/sessions#destroy" 
  end

  # root画面
  root 'display_items#index'
  # ユーザー新規作成系のルーティング(※暫定！)
  resources :users do
    collection do
      get    :new_info #会員情報入力画面
      post   :create_info #処理
      get    :new_phone #電話番号入力画面
      post   :create_phone #処理
      get    :new_address #住所入力画面
      post   :create_address #処理
      get    :new_credit #クレカ入力画面
      post   :create_credit #処理
      get    :complete #完了画面
    end
  end
  # マイページのルーティング
  resources :mypages, only: [:index] do
    collection do
      get    :logout #ログアウト画面
      get    :display_items #出品中画面
      get    :trading_items #取引中画面
      get    :finished_items #売却済み画面
    end
  end
  # ニックネーム&紹介文の編集
  resources :user_nicknames, only: [:edit, :update]
  # 会員情報の編集
  resources :user_profiles, only: [:edit, :update]
  # クレジットカードの編集
  resources :credit_cards

  resources :addresses,only: [:edit, :update]

  # 商品系のルーティング
  resources :display_items do
    member do
      get   :buy #購入確認画面
      post  :pay #購入処理
    end
    collection do
      post  :first_category_search #カテゴリ検索メソッド(第1段階)
      post  :second_category_search #カテゴリ検索メソッド(第2段階)
      post  :size_search #サイズ検索メソッド
      post  :brand_search #ブランド検索メソッド
    end
    resources :comments, only: [:create, :destroy]
  end
  # カテゴリのルーティング
  resources :categories, only: [:index] do
    collection do
      post  :search_level1 #出品ページの検索、カテゴリ階層2
      post  :search_level2 #出品ページの検索、カテゴリ階層3
    end
  end
  # サイズのルーティング
  resources :sizes, only: [:index] do
    collection do
      post  :search #出品ページの検索
    end
  end
  # ブランドのルーティング
  resources :brands, only: [:index] do
    collection do
      post  :enter #ブランドボックスの作成チェック
      post  :search #出品ページの検索
    end
  end
  # 配送方法のルーティング
  resources :delivery_methods, only: [:index] do
    collection do
      post  :search #出品ページの検索
    end
  end

end
