class ProductsController < ApplicationController
  def all_products
    products = Product.all

    render json: products.as_json
  end
end
