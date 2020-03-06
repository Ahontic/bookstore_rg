# frozen_string_literal: true

Rails.application.routes.draw do
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  devise_for :customers, controllers: { omniauth_callbacks: 'customers/omniauth_callbacks',
                                        registrations: 'customers/registrations',
                                        confirmations: 'customers/confirmations' }

  root to: 'pages#home'

  resources :addresses
  resources :customers, only: %i[edit]

  resources :categories, only: %i[index show] do
    resources :books, only: %i[index show]
  end

  resources :checkouts, only: %i[show update]
  resources :coupons, only: %i[create destroy]
  resources :carts, only: %i[destroy show update] do
    resources :coupons
  end
  resources :books, only: [] do
    resources :reviews
  end

  resources :orders, only: %i[show]
  resources :carts, only: %i[index]
  resources :line_items, only: %i[create show destroy] do
    post 'add', to: 'line_items#add_quantity', as: 'add', on: :member
    post 'reduce', to: 'line_items#reduce_quantity', as: 'reduce', on: :member
  end

  match '*unmatched', to: 'application#not_found', constraints: lambda { |req|
    req.path.exclude? 'rails/active_storage'
  }, via: :all
end
