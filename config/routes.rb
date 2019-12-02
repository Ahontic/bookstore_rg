# frozen_string_literal: true

Rails.application.routes.draw do
  root to: 'pages#home'

  resources :categories, only: [:index, :show] do
    resources :books, only: [:index, :show]
  end
end
