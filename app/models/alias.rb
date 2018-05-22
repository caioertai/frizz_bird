# frozen_string_literal: true

# app/models/alias.rb
class Alias < ApplicationRecord
  has_many :ingredients

  validates :cid, uniqueness: true, presence: true

  def fetch_info
    doc = HTTParty.get(api_url).parsed_response
    update(
      name: doc['Record']['Information'].first['StringValue'],
      document: doc.to_json.gsub('=>', ':').gsub('nil', 'null')
    )
  end

  def json
    JSON.parse(document)
  end

  def api_url
    "#{ENV['ing_api_source']}/rest/pug_view/index/compound/#{cid}/JSON/?"
  end
end
