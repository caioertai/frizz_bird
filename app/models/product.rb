# frozen_string_literal: true

# app/models/product.rb
class Product < ApplicationRecord
  validates :name, presence: true
  validates :ean, uniqueness: true, allow_nil: true

  belongs_to :item
  has_many :product_ingredients, dependent: :destroy
  has_many :ingredients, through: :product_ingredients

  mount_uploader :photo, PhotoUploader
  monetize :price_cents

  def parse(*attributes)
    ParseService.new(self, attributes)
  end

  (attribute_names + %w[ingredients]).each do |attribute|
    define_method :"parse_#{attribute}" do
      ParseService.new(self, [attribute.to_sym])
    end
  end
end
