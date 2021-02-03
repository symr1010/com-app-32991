Rails.application.routes.draw do
  devise_for :users
  resources :guides, only: [:index, :new, :create, :show]
  root to: "guides#index"
  resources :users, only: [:edit, :update]
end
