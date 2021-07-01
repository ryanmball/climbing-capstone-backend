class UsersController < ApplicationController
  before_action :authenticate_user, except: [:create]

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
    user = User.find(params[:id])
    render json: user
  end
  
  def update
    user = User.find(current_user.id)
    if params[:password] && params[:password_confirmation]
      user.password = params[:password]
      user.password_confirmation = params[:password_confirmation]
    end
    user.first_name = params[:first_name] || user.first_name
    user.last_name = params[:last_name] || user.last_name
    user.email = params[:email] || user.email
    user.profile_pic = params[:profile_pic] || user.profile_pic
    if user.save
      render json: user, status: 200
    else
      render json: { errors: user.errors.full_messages }, status: :unprocessable_entity
    end
  end

  def destroy
    if current_user.id == params[:id].to_i
      user = User.find(current_user.id)
      user.destroy
      render json: { message: "User successfully destroyed!" }
    else
      render json: { message: "Unathorized" }, status: 401
    end
  end
end
