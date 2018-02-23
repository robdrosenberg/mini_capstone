class ProductsController < ApplicationController
  before_action :authenticate_admin, except: [:index, :show]
  def index
      
    products = Product.all
    render json: products.as_json

    # if current_user
      
    # else
    #   render json: []
    # end

    # search_input = params[:search]
    # price_sort = params[:price_sort]
    # if search_input
    #   products = Product.all.order(id: :asc).where("title LIKE ?", "%#{search_input}%")
    # end
    # if price_sort
    #   products = Product.all.order(price: :asc)
    # end
  end

  def show
    product = Product.find_by(id: params["id"])
    render json: product.as_json
  end

  def create
    product = Product.new(
      title: params[:title],
      price: params[:price],
      description: params[:description],
      image_url: params[:image_url],
      supplier_id: params[:supplier_id]
      )
    product.save

    if product.save
      render json: product.as_json
    else
      render json: {error: product.errors.full_messages}, status: :unprocessable_entity
    end
  end

  def update
    product = Product.find_by(id: params[:id])
    product.title = params[:title] || product.title
    product.price = params[:price] || product.price
    product.description = params[:description] || product.price
    if product.save
      render json: product.as_json
    else
      render json: {
        error: product.errors.full_messages, status: :unprocessable_entity}
    end
  end

  def destroy
    product = Product.find_by(id: params["id"])
    product.destroy
    render json: {message: "Product deleted Succesfully"}
  end

end
