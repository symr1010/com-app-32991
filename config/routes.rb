Rails.application.routes.draw do
  devise_for :users
  get 'guides/index'
  root to: "guides#index"
end
