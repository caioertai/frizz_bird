# frozen_string_literal: true

Rails.application.routes.draw do
  namespace :admin do
    resources :ingredients
    resources :items
    resources :products
    resources :product_ingredients

    root to: 'products#index'
  end

  root to: 'pages#home'
end
