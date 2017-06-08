Rails.application.routes.draw do
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  devise_for :users, :controllers => { :omniauth_callbacks => "users/omniauth_callbacks" }
  root to: 'pages#home'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :bars do
    resources :drinks
    resources :orders, only: [:index, :create, :update, :destroy, :show] do
      resources :order_lines, only: [:create]
    end
    namespace :waiter do
      resources :orders, only: [ :index, :show]
    end
  end
end
