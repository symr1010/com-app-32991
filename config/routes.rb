Rails.application.routes.draw do
  devise_for :users
  root to: "guides#index"
  # resources :users, only: [:edit, :update]
end
