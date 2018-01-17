class ProductsController < ApplicationController
  def all_products
    products = Product.all

    render json: products.as_json
  end

  def blue_yeti
    product = Product.find_by(title: "BlueYeti Microphone")
    render json: product.as_json
  end

  def seiko_watch
    product = Product.find_by(title: "Seiko Watch")
    render json: product.as_json
  end
end
