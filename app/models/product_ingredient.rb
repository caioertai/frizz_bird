# frozen_string_literal: true

# app/models/product_ingredient.rb
class ProductIngredient < ApplicationRecord
  belongs_to :product
  belongs_to :ingredient

  validates :product, uniqueness: { scope: :ingredient }
end
