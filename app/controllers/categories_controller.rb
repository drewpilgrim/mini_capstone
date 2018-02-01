class CategoriesController < ApplicationController
  def index 
    render json: Category.all.as_json
  end

  def show
    response = Category.find_by(id: params["id"])
    if response
      if response.products
        render json: response.products.as_json
      else
        render json: {Error:"No products for that category"}
      end
    else
      render json: {Error:"No products for that Category"}
    end
  end
end
