# frozen_string_literal: true

# app/services/parse_service.rb
class ParseService
  def initialize(product, attributes = [])
    @doc = Nokogiri::HTML(product.item.document)
    @header = @doc.search('.product-header__infos').last
    @presentation = @doc.at("[href='#{product.path}']")
                        .ancestors('.presentation-offer-block')

    attributes.each { |attribute| send(:"parse_#{attribute}", product) }
    product.save
  end

  private

  def parse_photo(product)
    product.remote_photo_url = @presentation.at('figure img')['src']
  end

  def parse_ean(product)
    ean = @presentation.at('.presentation-offer-info__ean strong')
    product.ean = ean.nil? ? '' : ean.text.strip
  end

  def parse_price(product)
    list = @presentation.at('.presentation-offer-lists')
    prices = list.search('.presentation-offer__price-value strong')
    prices = prices.map { |price| price.text.delete(',').to_i / prices.length }
    product.price = prices.empty? ? 0 : prices.sum.to_i
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
    formula.next_element.text.split(/[,;]|\(and\)/i).each do |ing_str|
      ing_str = normalize_string(ing_str)

      ProductIngredient.create(
        product: product,
        ingredient: Ingredient.find_or_create_by(name: ing_str)
      )
    end
  end

  def normalize_string(string)
    string.gsub('/\s+/', ' ').gsub(' / ', '/').strip.chomp('.').strip
  end
end
