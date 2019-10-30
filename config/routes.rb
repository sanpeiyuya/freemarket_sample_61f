Rails.application.routes.draw do
  devise_for :users
  # root 'user#index'
  root 'display_items#new'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :display_items, only: [:new, :create]
end
