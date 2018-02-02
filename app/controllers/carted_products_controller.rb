class CartedProductsController < ApplicationController
  def create
    cart = CartedProduct.new(user_id: current_user.id)
  end
end
