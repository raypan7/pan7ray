# frozen_string_literal: true

class ProductsController < ApplicationController
  def index
    @products = Product.all
  end

  def show
    @product = Product.find(params[:id])
  end

  def add_to_cart
    @product = Product.find(params[:id])

    if current_cart.products.exclude?(@product)
      current_cart.add_product_to_cart(@product)
      flash[:notice] = "Add #{@product.title} to cart successfully!"
    else
      flash[:warning] = 'You already have this product in your cart!'
    end

    redirect_to(products_path)
  end
end
