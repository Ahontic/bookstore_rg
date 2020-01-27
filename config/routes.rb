# frozen_string_literal: true

Rails.application.routes.draw do
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  devise_for :customers, controllers: { omniauth_callbacks: 'customers/omniauth_callbacks',
                                        registrations: 'customers/registrations' }

  root to: 'pages#home'

  resources :addresses
  resources :customers, only: %i[edit]

  resources :categories, only: %i[index show] do
    resources :books, only: %i[index show]
  end

  resources :coupons
  resources :carts, only: %i[destroy show update] do
    resources :coupons
  end

  resources :orders, only: %i[index show new]
  post 'line_items/:id/add' => 'line_items#add_quantity', as: 'line_item_add'
  post 'line_items/:id/reduce' => 'line_items#reduce_quantity', as: 'line_item_reduce'
  post 'line_items' => 'line_items#create'
  get 'line_items/:id' => 'line_items#show', as: 'line_item'
  delete 'line_items/:id' => 'line_items#destroy'

  match '*unmatched', to: 'application#not_found', constraints: lambda { |req|
    req.path.exclude? 'rails/active_storage'
  }, via: :all

  resources :books, only: [] do
    resources :reviews
  end
end
