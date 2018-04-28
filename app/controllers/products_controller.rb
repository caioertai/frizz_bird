# frozen_string_literal: true

# app/controllers/products_controller.rb
class ProductsController < ApplicationController
  def index; end

  def show; end

  def search
    if params[:query].numeric?
      @product = Product.find_by_ean(params[:query])
      redirect_to @product
    else
      redirect_to root_path
    end
  end
end
