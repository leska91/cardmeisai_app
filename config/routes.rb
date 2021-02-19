Rails.application.routes.draw do
  devise_for :users
  root to: 'orders#index'
  resources :orders, only: [:index, :new, :create, :destroy, :edit, :update] do
    member do
      get 'search'
    end
  end
end
