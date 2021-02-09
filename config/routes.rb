Rails.application.routes.draw do
  devise_for :users
  resources :guides do
    resources :messages, only: :create
  end  
  root to: "guides#index"
  resources :users, only: [:show, :edit, :update]
end
