# frozen_string_literal: true

# app/services/collector_service.rb
class CollectorService
  def initialize(category)
    @page = 0
    @category = category
    @extra_path = '/beleza-e-saude/cabelos'

    loop do
      break unless collect_category
    end
  end

  def collect_category
    collect_page(current_url)
    # rescue # Add exception
    # break
  end

  def collect_page(url)
    doc = Nokogiri::HTML(HTTParty.get(url), nil, Encoding::UTF_8.to_s)
    doc.search('.product-block__title a').map do |element|
      product = Product.find_or_create_by(path: element.attr('href'))
      byebug
    end
  end

  private

  def current_url
    "#{ENV['ext_source']}#{@extra_path}/#{@category}/c?pagina=#{@page += 1}"
  end
end
