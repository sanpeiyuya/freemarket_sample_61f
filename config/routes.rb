Rails.application.routes.draw do
  devise_for :users

  root to: 'items#index'
  resources :display_items, only: [:new, :create]
  resources :mypages, only: [:index]
end
