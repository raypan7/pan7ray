# frozen_string_literal: true

class CartItemsController < ApplicationController

  def update
    @cart = current_cart
    @cart_item = @cart.cart_items.find_by(product_id: params[:id])

    @cart_item.update(cart_item_params)
    flash[:notice] = '成功變更數量'

    redirect_to cart_path
  end

  def destroy
    @cart = current_cart
    @cart_item = @cart.cart_items.find_by(product_id: params[:id])
    @product = @cart_item.product
    @cart_item.destroy

    flash[:warning] = "成功將 #{@product.title} 移除購物車!"
    redirect_to(:back)
  end

  private

  def cart_item_params
    params.require(:cart_item).permit(:quantity)
  end

end