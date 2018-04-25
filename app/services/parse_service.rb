# frozen_string_literal: true

# app/services/parse_service.rb
class ParseService
  def initialize(product, attributes = [])
    @doc = Nokogiri::HTML(product.item.document)
    @header = @doc.search('.product-header__infos').last
    @presentation = @doc.at("[href='#{product.path}']").ancestors('.presentation-offer-block')

    attributes.each { |attribute| send(:"parse_#{attribute}", product) }
    product.save
  end

  private

  def parse_ean(product)
    ean = @presentation.at('.presentation-offer-info__ean strong')
    product.ean = ean.nil? ? '' : ean.text.strip
  end

  def parse_factory(product)
    factory = @header.at('.cr-icon-factory.product-block__meta-icon')
    product.factory = factory.nil? ? '' : factory.parent.text.strip
  end

  def parse_brand(product)
    brand = @header.at('.cr-icon-brand.product-block__meta-icon')
    product.brand = brand.nil? ? '' : brand.parent.text.strip
  end

  def parse_ingredients(product)
    formula = @doc.at("#descricao h2:contains('Composição')")
    return if formula.nil?
    # Spliting on \ breaks things like PEG/PPG/Polybutylene Glycol-8/5/3 Glycerin
    formula.next_element.text.split(/[,;]|\(and\)/i).each do |ing_str|
      ing_str = normalize_string(ing_str)

      next if product.ingredients.find_by_name(ing_str)

      ingredient = Ingredient.find_by_name(ing_str) || Ingredient.create(name: ing_str)
      product.product_ingredients << ProductIngredient.new(product: product, ingredient: ingredient)
    end
  end

  def normalize_string(string)
    string.gsub('/\s+/', ' ').gsub(' / ', '/').strip.chomp('.').strip
  end
end
