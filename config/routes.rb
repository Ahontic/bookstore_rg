# frozen_string_literal: true

Rails.application.routes.draw do
  get 'orders/index'
  get 'orders/show'
  get 'orders/new'
  get 'carts/show'
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  devise_for :customers, controllers: { omniauth_callbacks: 'customers/omniauth_callbacks' }
  root to: 'pages#home'

  resources :addresses
  resources :customers do
    resources :addresses
  end
  resources :categories, only: %i[index show] do
    resources :books, only: %i[index show]
  end
  resources :books do
    resources :reviews
  end

  get 'carts/:id' => 'carts#show', as: 'cart'
  delete 'carts/:id' => 'carts#destroy'

  resources :orders
  post 'line_items/:id/add' => 'line_items#add_quantity', as: 'line_item_add'
  post 'line_items/:id/reduce' => 'line_items#reduce_quantity', as: 'line_item_reduce'
  post 'line_items' => 'line_items#create'
  get 'line_items/:id' => 'line_items#show', as: 'line_item'
  delete 'line_items/:id' => 'line_items#destroy'

  match '*unmatched', to: 'application#not_found', constraints: lambda { |req|
    req.path.exclude? 'rails/active_storage'
  }, via: :all
end
