# frozen_string_literal: true

Rails.application.routes.draw do
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  devise_for :customers, controllers: { omniauth_callbacks: 'customers/omniauth_callbacks' }
  root to: 'pages#home'

  resources :addresses
  resources :categories, only: %i[index show] do
    resources :books, only: %i[index show]
  end
  match '*unmatched', to: 'application#not_found', via: :all
end
