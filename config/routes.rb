# frozen_string_literal: true

Rails.application.routes.draw do
  devise_for :customers, controllers: { omniauth_callbacks: 'customers/omniauth_callbacks' }
  root to: 'pages#home'

  resources :categories, only: %i[index show] do
    resources :books, only: %i[index show]

    match '*unmatched', to: 'application#not_found', via: :all
  end
end
