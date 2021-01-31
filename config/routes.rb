Rails.application.routes.draw do
  devise_for :users
  resources :guides, only: [:index, :new, :create]
  root to: "guides#index"
  resources :users, only: [:edit, :update]
end
