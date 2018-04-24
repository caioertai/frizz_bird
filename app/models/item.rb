# frozen_string_literal: true

# app/models/item.rb
class Item < ApplicationRecord
  validates :path, presence: true

  def visit
    request = HTTParty.get("#{ENV['ext_source']}#{path}")
    doc = Nokogiri::HTML(request, nil, Encoding::UTF_8.to_s).at('#product-page')
    return false unless request.code == 200 || doc.present?
    update(document: doc)
  end

  def split_into_products
    Nokogiri.HTML(document).search('.presentation-offer-block').each do |item|
      ean = item.at('.presentation-offer-info__ean strong').text
      product = Product.find_or_initialize_by(ean: ean)
      next if product.persisted?
      product.update(
        name: item.at('.presentation-offer-info__name').text.strip,
        volume: item.at('.presentation-offer-info__description').text,
        item: self
      )
    end
  end
end
