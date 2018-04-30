# frozen_string_literal: true

# app/controllers/products_controller.rb
class ProductsController < ApplicationController
  def index; end

  def show
    @product = Product.find(params[:id])
  end

  def search
    if params[:query].numeric?
      @product = Product.find_by_ean(params[:query])
      redirect_to @product
    else
      @items = Item.where('name ILIKE ?', "%#{params[:query]}%").order(name: :ASC)
    end
  end
end
