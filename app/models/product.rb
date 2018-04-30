# frozen_string_literal: true

# app/models/product.rb
class Product < ApplicationRecord
  validates :ean, uniqueness: true, allow_nil: true

  belongs_to :item
  has_many :ingredients, through: :item

  mount_uploader :photo, PhotoUploader
  monetize :price_cents

  def name
    item.name
  end

  def brand
    item.brand
  end

  def factory
    item.factory
  end

  def parse(*attributes)
    ParseService.new(self, attributes)
  end

  (attribute_names + %w[ingredients]).each do |attribute|
    define_method :"parse_#{attribute}" do
      ParseService.new(self, [attribute.to_sym])
    end
  end
end
