class OrdersController < ApplicationController
  before_action :authenticate_user

  def index
    if current_user
      orders = current_user.orders
      render json: orders.as_json
    else
      render json: {message: "No current user logged in."}
    end
  end

  def create
    product = Product.find_by(id: params[:product_id])
    calculated_subtotal = product.price * params[:quantity].to_i
    calculated_tax = calculated_subtotal * 0.09
    calculated_total = calculated_subtotal+calculated_tax

    order = Order.new(
        product_id: params[:product_id],
        user_id: current_user.id,
        quantity: params[:quantity],
        subtotal: calculated_subtotal,
        tax: calculated_tax,
        total: calculated_total,
      )

    if order.save
      render json: {message: "Your order has been recieved."}, status: :created
    else
      render json: {errors: order.errors.full_messages}, status: :bad_request
    end
  end

end
