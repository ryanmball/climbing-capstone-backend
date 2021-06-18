class UsersController < ApplicationController
  before_action :authenticate_user, except: [:index, :create]

  def index
    render json: User.all.order(:id)
  end

  def create
    user = User.new(
      first_name: params[:first_name],
      last_name: params[:last_name],
      email: params[:email],
      password: params[:password],
      password_confirmation: params[:password_confirmation]
    )
    if user.save
      render json: { message: "User created successfully" }, status: :created
    else
      render json: { errors: user.errors.full_messages }, status: :bad_request
    end
  end

  def show
    render json: User.find(current_user.id)
  end
  
  def update
    user = User.find(current_user.id)
    user.first_name = params[:first_name] || user.first_name
    user.last_name = params[:last_name] || user.last_name
    user.email = params[:email] || user.email
    # user.password = params[:password] || user.password
    # NEED TO FIGURE OUT HOW TO UPDATE PASSWORD
    if user.save
      render json: { message: "User updated successfully" }
    else
      render json: { errors: user.errors.full_messages }, status: :unprocessable_entity
    end
  end

  def destroy
    user = User.find(current_user.id)
    user.destroy
    render json: { message: "User successfully destroyed!" }
  end
end
