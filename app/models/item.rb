# frozen_string_literal: true

# app/models/item.rb
class Item < ApplicationRecord
  validates :path, presence: true

  def visit
    request = HTTParty.get("#{ENV['ext_source']}#{path}")
    doc = Nokogiri::HTML(request, nil, Encoding::UTF_8.to_s)
    return false unless request.code == 200 || doc.at('#product-page').present?
    update(document: doc)
  end
end
