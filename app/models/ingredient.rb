# frozen_string_literal: true

# app/models/ingredient.rb
class Ingredient < ApplicationRecord
  validates :name, presence: true, uniqueness: { case_sensitive: false }

  belongs_to :alias, optional: true

  has_many :product_ingredients, dependent: :destroy
  has_many :products, through: :product_ingredients

  after_save :refresh_alias, if: :alias_id_changed?

  def refresh_alias
    # TODO: Make this a sql query
    ordered_list = self.alias.ingredients.sort_by do |ingredient|
      -ingredient.products.count
    end
    self.alias.update(name: ordered_list.first.name)
  end

  def self.find_or_create_by_name(name)
    insensitive_match = Ingredient.where('lower(name) = ?', name.downcase).first
    find_or_create_by(name: insensitive_match ? insensitive_match.name : name)
  end
end
