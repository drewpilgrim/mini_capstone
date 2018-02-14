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
      user_id: current_user.id,
      )
    c_products = current_user.carted_products.where(status: "Carted")
    # order.subtotal = c_products.reduce {|acc, el| (acc.subtotal * acc.quantity) + (el.subtotal * el.quantity)}
    # order.tax = c_products.reduce {|acc, el| (acc.tax * acc.quantity) + (el.tax * el.quantity)}
    # order.total = c_products.reduce {|acc, el| (acc.total * acc.quantity) + (el.total * el.quantity)}
    subtotal = 0
    c_products.each do |c_product|
      subtotal += (c_product.product.price * product.quantity)
    end
    order.subtotal = subtotal
    order.tax = subtotal * 0.09
    order.total = subtotal + order.tax

    if order.save
      carted_products.update_all(status: "Purchased", order_id: order.id)
      render json: {Message: "Order succesful #{order.subtotal}, #{order.tax}, #{order.toal}", }, status: :created
    else
      render json: {Error: order.errors.full_messages}, status: :bad_request
    end


  end
end
