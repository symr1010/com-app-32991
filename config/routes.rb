Rails.application.routes.draw do
  devise_for :users
  resources :guides, only: [:index, :new, :create, :show, :edit, :update]
  root to: "guides#index"
  resources :users, only: [:edit, :update]
end
