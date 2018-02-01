class CategoriesController < ApplicationController

  def show
    category = Category.find_by(id: params["id"])
    products = category.products
    render json: products.as_json
  end

end
