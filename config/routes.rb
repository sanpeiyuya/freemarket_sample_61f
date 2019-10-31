Rails.application.routes.draw do
  devise_for :users
  root 'user_profiles#edit'
  
  
  resources :display_items, only: [:new, :create]
  resources :users, only: [:index, :edit,]
  resources :user_profiles, only: [:edit, :update]

end
