class ProductsController < ApplicationController

  def index
    render json: (Product.all).to_json
  end

  def show
    productID = params[:id]
    if (Product.find_by(id: productID) == nil)
      render json: {Error_Message: "No product by that id"}
    else
      render json: (Product.find_by(id: productID)).to_json
    end
  end

  def create
    product = Product.create(title: params[:title], price: params[:price], string: params[:string], image_url:params[:image_url], description: params[:description])
    render json: product.as_json
  end

  def update
    product = Product.find_by(id: params[:id])
    product.update(
      title: params[:title],
      description: params[:description]
      )
    render json: product.as_json
  end

  def destroy 
    product = Product.find_by(id: params[:id])
    if product
      product.destroy
      render json: {Message: "Destroyed Product"}
    else
      render json: {Message: "No product by that id"}
    end
  end



end