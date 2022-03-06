# frozen_string_literal: true

class CartItemsController < ApplicationController

  def update
    @cart = current_cart
    @cart_item = @cart.cart_items.find_by(product_id: params[:id])

    @cart_item.update(cart_item_params)
    flash[:notice] = 'Cart Item Chaged!'

    redirect_to(cart_path)
  end

  def destroy
    @cart = current_cart
    @cart_item = @cart.cart_items.find_by(product_id: params[:id])
    @product = @cart_item.product
    @cart_item.destroy

    flash[:warning] = "Successfully Remove #{@product.title} From Cart!"
    redirect_to(products_path)
  end

  private

  def cart_item_params
    params.require(:cart_item).permit(:quantity)
  end

end