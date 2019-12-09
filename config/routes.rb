# frozen_string_literal: true

Rails.application.routes.draw do
  root to: 'pages#home'

  resources :categories, only: %i[index show] do
    resources :books, only: %i[index show]

  match '*unmatched', to: 'application#route_not_found', via: :all
  end
end
