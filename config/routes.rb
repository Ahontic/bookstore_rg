# frozen_string_literal: true

Rails.application.routes.draw do
  root to: 'pages#home'

  resources :books, only: [:index, :show]
  resources :category, only: [:index, :show] do
    resources :books, only: [:index, :show]
  end
end
