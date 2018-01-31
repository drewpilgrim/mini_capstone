class SuppliersController < ApplicationController

  def index
    suppliers = Supplier.all.order(id: :DESC)
    render json: suppliers.as_json
  end
end
