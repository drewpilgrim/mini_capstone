class ProductsController < ApplicationController

  def display
    render json: (Product.all).to_json

  end
end
