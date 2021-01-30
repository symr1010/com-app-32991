Rails.application.routes.draw do
  devise_for :users
  resources :guides, only: [:index]
  root to: "guides#index"
  resources :users, only: [:edit, :update]
end
