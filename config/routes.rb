Rails.application.routes.draw do
  devise_for :users
  root 'items#index'
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
    end
  end
  # ニックネーム&紹介文の編集
  resources :user_nicknames, only: [:edit, :update]
  # 会員情報の編集
  resources :user_profiles, only: [:edit, :update]
  # クレジットカードの編集
  resources :credit_cards

  # 商品系のルーティング
  resources :display_items do
    member do
      get   :buy #購入確認画面
      post  :pay #購入処理
    end
  end
end
