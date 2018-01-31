class ApplicationController < ActionController::API
  include Knock::Authenticable


  def authenticate_admin
    unless current_user.admin
      render json: {message: "Error, user is not an admin"}
    end

  end

end
