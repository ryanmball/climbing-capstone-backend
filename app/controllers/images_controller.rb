class ImagesController < ApplicationController
  before_action :authenticate_user
  
  def create
    image = Image.new(
     url: params[:url],
     collection_id: params[:collection_id],
    )
    if image.save
      render json: image         #HAPPY PATH
    else
      render json: { errors: image.errors.full_messages }, status: :unprocessable_entity       #SAD PATH
    end
  end

  def destroy
    image = Image.find(params[:id])
    image.destroy
    render json: { message: "Image successfully destroyed!" }
  end
end
