class UsersController < ApplicationController
  before_action :authenticate_user
  def create 
    user = User.new(
      name: params[:name],
      email: params[:email],
      password: params[:password],
      password_confirmation: params[:password_confirmation]
      )
    if user.save
      render json: {Message: "User created succesfully"}, status: :created
    else
      render json: {Error: user.errors.full_messages}, status: :bad_request
    end
  end

  def is_admin
    admin = current_user.admin
    render json: {admin: "#{admin}"}
  end
end
