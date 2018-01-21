class ProductsController < ApplicationController
  def index
    products = Product.all
    render json: products.as_json
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
      )
    product.save
    render json: product.as_json
  end

  def update
    product = Product.find_by(id: params[:id])
    product.update(
      title: params[:title],
      price: params[:price],
      )
    render json: product.as_json
  end
end
