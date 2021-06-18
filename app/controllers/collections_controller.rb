class CollectionsController < ApplicationController
  before_action :authenticate_user, except: [:index, :show]
  
  def index
    render json: Collection.all.order(:id)
  end

  def create
    collection = Collection.new(
      name: params[:name],
      partners: params[:partners],
      highlights: params[:highlights],
      user_id: current_user.id,
    )
    if collection.save
      render json: collection         #HAPPY PATH
    else
      render json: { errors: collection.errors.full_messages }, status: :unprocessable_entity       #SAD PATH
    end
  end

  def show
    render json: Collection.find(params[:id])
  end

  def update
    collection = Collection.find(params[:id])
    collection.name = params[:name] || collection.name
    collection.partners = params[:partners] || collection.partners
    collection.highlights = params[:highlights] || collection.highlights
    if collection.save
      render json: collection         #HAPPY PATH
    else
      render json: { errors: collection.errors.full_messages }, status: :unprocessable_entity       #SAD PATH
    end
  end

  def destroy
    collection = Collection.find(params[:id])
    collection.destroy
    render json: { message: "Collection successfully destroyed!"}
  end
end
