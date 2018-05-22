# frozen_string_literal: true

# app/models/ingredient.rb
class Ingredient < ApplicationRecord
  validates :name, presence: true, uniqueness: { case_sensitive: false }

  belongs_to :alias, optional: true

  has_many :item_ingredients, dependent: :destroy
  has_many :items, through: :item_ingredients

  has_many :products, through: :items

  scope :unsearched, -> { where(searched_at: nil) }

  def translate_name
    update(translated_name: EasyTranslate.translate(name, to: 'en'))
  end

  def parse_alias
    IngredientService.new(self)
  end

  def self.find_or_create_by_name(name)
    insensitive_match = Ingredient.where('lower(name) = ?', name.downcase).first
    find_or_create_by(name: insensitive_match ? insensitive_match.name : name)
  end
end
