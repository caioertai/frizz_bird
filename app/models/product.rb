# frozen_string_literal: true

# app/models/product.rb
class Product < ApplicationRecord
  validates :ean, :path, uniqueness: true

  has_many :product_ingredients, dependent: :destroy
  has_many :ingredients, through: :product_ingredients
end
