# frozen_string_literal: true

# app/controllers/products_controller.rb
class ProductsController < ApplicationController
  def index; end

  def show
    @product = Product.find(params[:id])
  end

  def ean_not_found
    @product = Product.ean_not_found(params[:ean])
    render :show
  end

  def search
    query = params[:query]
    if query.numeric?
      @product = Product.find_by_ean(query)
      redirect_to @product || ean_not_found_path(query)
    elsif query.size > 3
      @items = Item.where('name ILIKE ?', "%#{query}%").order(name: :ASC)
    end
  end
end
