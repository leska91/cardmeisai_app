Rails.application.routes.draw do
  root to: 'orders#index'
  resources :orders, only: [:index, :new, :create, :destroy, :edit, :update]
end
