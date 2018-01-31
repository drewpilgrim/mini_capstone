class ProductsController < ApplicationController
  before_action :authenticate_admin, execpt: [:index, :show]
  
  def index
    products = Product.all.order(id: :DESC)

    search_term = params[:search]
    price_sort = params[:price_sort]
    if search_term 
      products = products.where("title LIKE ?" ,"%#{search_term}%")
    end
    if price_sort == "1"
      products = products.all.order(price: :ASC)
    end
    if price_sort == "2"
      products = products.all.order(price: :DESC)
    end
    render json: products.as_json
    
  end

  def show
    productID = params[:id]
    if (Product.find_by(id: productID) == nil)
      render json: {Error_Message: "No product by that id"}
    else
      render json: (Product.find_by(id: productID)).as_json
    end
  end

  def create
    if current_user.admin
      product = Product.new(title: params[:title], price: params[:price], string: params[:string], image_url:params[:image_url], description: params[:description])
      if product.save
        render json: product.as_json
      else
        render json: {error: product.errors.full_messages, status: :unprocessable_entity}
      end
    end
  end

  def update
    if current_user.admin
      product = Product.find_by(id: params[:id])
      if product.update(
        title: params[:title],
        description: params[:description],
        price: params[:price]
        )
        render json: product.as_json
      else
        render json: {error: product.errors.full_messages, status: :unprocessable_entity}
      end
    end
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