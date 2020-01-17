# frozen_string_literal: true

Rails.application.routes.draw do
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  devise_for :customers, controllers: { omniauth_callbacks: 'customers/omniauth_callbacks',
                                        registrations: 'customers/registrations' }
  root to: 'pages#home'

  resources :addresses
  resources :customers, only: %i[edit]
  resources :customers do
    resources :addresses
  end
  resources :categories, only: %i[index show] do
    resources :books, only: %i[index show]
  end
  resources :books, only: [] do
    resources :reviews
  end
  match '*unmatched', to: 'application#not_found', constraints: lambda { |req|
    req.path.exclude? 'rails/active_storage'
  }, via: :all
end
