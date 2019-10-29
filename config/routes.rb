Rails.application.routes.draw do
  devise_for :users
  root 'user_profiles#edit'
  resources :users, only: [:index, :edit,]
  resources :user_profiles, only: [:edit, :update]
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
