Rails.application.routes.draw do
  devise_for :users
  root to: 'items#index'
  resources :items
  resources :users, only: [:edit, :update]
  resources :rooms, only: [:index, :new, :create, :destroy] do
    resources :chats, only: [:index, :create]
  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
