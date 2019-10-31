Rails.application.routes.draw do
  devise_for :users
  root 'display_items#new'
  
  
  resources :display_items, only: [:new, :create]
  resources :users, only: [:index, :edit,]
  resources :user_profiles, only: [:edit, :update]

end
