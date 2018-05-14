# frozen_string_literal: true

# app/services/ingredient_service.rb
class IngredientService
  def initialize(ingredient)
    @ingredient = ingredient
    search_ingredient
    save_alias unless @ingredient_path.nil?
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

  def get_page(url)
    request = HTTParty.get(url)
    Nokogiri::HTML(request, nil, Encoding::UTF_8.to_s)
  end

  def search_ingredient
    doc = get_page(search_url).at('#table-browse [align=left] a')
    @ingredient_path = doc['href'] unless doc.nil?
    @ingredient.update(searched_at: Time.now)
  end

  def save_alias
    doc = get_page(ingredient_url)
    ingredient_alias = Alias.find_or_create_by(name: doc.at('h1').text)
    @ingredient.update(alias: ingredient_alias)

    return if ingredient_alias.document.present?
    ingredient_alias.update(
      document: doc,
      synonyms: doc.at('#Summary').at("strong:contains('Synonym')").next.text[1..-1]
    )
  end

  def ingredient_url
    "#{ENV['ing_source']}#{@ingredient_path}"
  end

  def search_url
    "#{ENV['ing_source']}/skindeep/search.php?query=#{@ingredient.name}&search_group=ingredients"
  end
end
