# frozen_string_literal: true

# app/models/product.rb
class Product < ApplicationRecord
  validates :name, presence: true
  validates :ean, uniqueness: true, allow_nil: true

  belongs_to :item
  has_many :product_ingredients, dependent: :destroy
  has_many :ingredients, through: :product_ingredients
end
