Rails.application.routes.draw do
  devise_for :users
  root to: 'items#index'
  resources :display_items, only: [:new, :create]
  resources :users, only: [:index, :edit,]
  resources :user_profiles, only: [:edit, :update]
  resources :mypages, only: [:index]
end
