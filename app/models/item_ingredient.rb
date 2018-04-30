# frozen_string_literal: true

# app/models/item_ingredient.rb
class ItemIngredient < ApplicationRecord
  belongs_to :item
  belongs_to :ingredient

  validates :item, uniqueness: { scope: :ingredient }
end
