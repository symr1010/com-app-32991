Rails.application.routes.draw do
  get 'guides/index'
  root to: "guides#index"
end
