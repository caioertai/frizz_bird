# frozen_string_literal: true

# app/models/item.rb
class Item < ApplicationRecord
  validates :path, presence: true

  def visit
    request = HTTParty.get("#{ENV['ext_source']}#{path}")
    return unless request.code == 200
    update(document: Nokogiri::HTML(request, nil, Encoding::UTF_8.to_s))
  end
end
