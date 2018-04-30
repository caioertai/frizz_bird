# frozen_string_literal: true

# app/models/item.rb
class Item < ApplicationRecord
  has_many :products, dependent: :destroy

  has_many :item_ingredients, dependent: :destroy
  has_many :ingredients, through: :item_ingredients

  validates :path, presence: true

  def visit
    request = HTTParty.get("#{ENV['ext_source']}#{path}")
    doc = Nokogiri::HTML(request, nil, Encoding::UTF_8.to_s).at('#product-page')
    return false unless request.code == 200 || doc.present?
    update(document: doc)
  end

  def doc
    Nokogiri.HTML(document)
  end

  def split_into_products
    doc.search('.presentation-offer-block').each do |item|
      ean = item.at('.presentation-offer-info__ean strong').text
      Product.find_or_initialize_by(ean: ean).update(
        name: item.at('.presentation-offer-info__name').text.strip,
        presentation: item.at('.presentation-offer-info__description').text,
        path: item.at('.presentation-offer-info__description a')['href'],
        item: self
      )
    end
  end
end
