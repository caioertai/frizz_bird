# frozen_string_literal: true

Rails.application.routes.draw do
  root to: 'pages#home'

  get 'products/search', to: 'products#search', as: :products_search
  resources :products, only: %i[index show]

  namespace :admin do
    resources :ingredients
    resources :items
    resources :products
    resources :item_ingredients

    root to: 'products#index'
  end
end
