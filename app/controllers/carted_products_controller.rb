class CartedProductsController < ApplicationController
  
  def index
    if current_user
      cart = current_user.carted_products.where(status: "carted")
      render json: cart.as_json
    else
      render json: []
    end
  end


  def create
    cart = CartedProduct.new(
        user_id: current_user.id,
        product_id: params[:product_id],
        quantity: params[:quantity],
        status: "carted"
      )
    if cart.save
      render json: cart.as_json 
    else
      render json: {error: cart.errors.full_messages, status: :unprocessable_entity}
    end
  end
end