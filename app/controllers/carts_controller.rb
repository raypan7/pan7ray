# frozen_string_literal: true

class CartsController < ApplicationController
  def clean
    current_cart.clean!
    flash[:warning] = '購物車已清空'
    redirect_to(cart_path)
  end
end
