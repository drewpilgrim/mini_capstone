class OrdersController < ApplicationController
  before_action :authenticate_user


  def index
    if current_user
      render json: current_user.orders.as_json
    else
      render json: {Error: "No current user"}
    end
  end

  def create 
    order = Order.new(
      product_id: params[:product_id],
      user_id: params[:user_id],
      quantity: params[:quantity]
      )
    order.subtotal = order.product.price * order.quantity
    order.tax = order.product.tax * order.quantity
    order.total = order.product.total * order.quantity

    if order.save
      render json: {Message: "Order succesful"}, status: :created
    else
      render json: {Error: user.errors.full_messages}, status: :bad_request
    end


  end
end
