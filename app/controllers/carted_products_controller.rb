class CartedProductsController < ApplicationController
  def index 
    if current_user
      render json: current_user.carted_products
    end
  end

  def create
    if current_user
      carted_prod = CartedProduct.new(user_id: current_user.id, product_id: params[:product_id], quantity: params[:quantity], status:"Carted")
      if carted_prod.save
        render json: {Message:"Product Ordered and Carted Succesfully"}
      else
        render json: {Error:"Product not carted succesfully"}
      end
    else
      render json: {Error:"Must be logged in"}
    end
  end
end
