# frozen_string_literal: true

Rails.application.routes.draw do
  devise_for :user_admins
  root to: 'pages#home'

  get 'products/search', to: 'products#search', as: :products_search
  get 'products/ean_not_found/:ean', to: 'products#ean_not_found', as: :ean_not_found
  resources :products, only: %i[index show]

  namespace :admin do
    resources :ingredients
    resources :aliases
    resources :items
    resources :products
    resources :item_ingredients
    resources :user_admins

    root to: 'products#index'
  end
end
