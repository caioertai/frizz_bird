# frozen_string_literal: true

# app/models/ingredient.rb
class Ingredient < ApplicationRecord
  validates :name, uniqueness: true, presence: true

  belongs_to :alias

  has_many :product_ingredients, dependent: :destroy
  has_many :products, through: :product_ingredients
end
