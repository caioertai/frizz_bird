# frozen_string_literal: true

# app/services/ingredient_service.rb
class IngredientService
  def initialize(ingredient)
    @ingredient = ingredient
    @alias_cid = fetch_cid
    @ingredient.update(searched_at: Time.now)
    update_ingredient_alias if @alias_cid.present?
  end

  def self.call
    loop do
      ingredient = Ingredient.where(searched_at: nil).first
      break if ingredient.nil?
      ingredient.parse_alias
      sleep 5
    end
  end

  private

  def fetch_cid
    doc = HTTParty.get(search_url)
    doc_request = doc.request

    # If search didn't redirect straight to compound page
    if doc_request.redirect.nil?
      doc = Nokogiri::HTML(doc, nil, Encoding::UTF_8.to_s)
      return nil unless doc.at('#msgportlet').nil? # nil if has no results alert
      doc.xpath(
        # First result xpath
        '//*[@id="maincontent"]/div/div[5]/div[1]/div[2]/div/div[2]/div/dl/dd'
      )&.text
    else
      doc_request.path.to_s[/\d+/]
    end
  end

  def update_ingredient_alias
    ingredient_alias = Alias.find_or_create_by(cid: @alias_cid)
    @ingredient.update(alias: ingredient_alias)

    ingredient_alias.fetch_info if ingredient_alias.document.nil?
  end

  def search_url
    "#{ENV['ing_source']}/pccompound/?term=#{@ingredient.translated_name.parameterize}"
  end
end
