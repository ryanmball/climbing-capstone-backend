class RecordsController < ApplicationController
  before_action :authenticate_user, except: [:index, :show]
  
  def index
    render json: Record.where(user_id: current_user.id).order(:date)
  end

  def create
    record = Record.new(
      date: params[:date],
      route_id: params[:route_id],
      grade: params[:grade],
      result: params[:result],
      in_progress: params[:in_progress],
      rating: params[:rating],
      partner: params[:partner],
      comments: params[:comments],
      collection_id: params[:collection_id],
      user_id: current_user.id,
    )
    if record.save
      render json: record         #HAPPY PATH
    else
      render json: { errors: record.errors.full_messages }, status: :unprocessable_entity       #SAD PATH
    end
  end

  def show
    render json: Record.find(params[:id])
  end

  def update
    record = Record.find(params[:id])
    record.date = params[:date] || record.date
    record.route_id = params[:route_id] || record.route_id
    record.grade = params[:grade] || record.grade
    record.result = params[:result] || record.result
    record.in_progress = params[:in_progress] || record.in_progress
    record.rating = params[:rating] || record.rating
    record.partner = params[:partner] || record.partner
    record.comments = params[:comments] || record.comments
    record.collection_id = params[:collection_id] || record.collection_id
    if record.save
      render json: record         #HAPPY PATH
    else
      render json: { errors: record.errors.full_messages }, status: :unprocessable_entity       #SAD PATH
    end
  end

  def destroy
    record = Record.find(params[:id])
    record.destroy
    render json: { message: "Record successfully destroyed!"}
  end

  def grades
    grades = Record.where(user_id: current_user.id).pluck(:grade)
    render json: grades.uniq
  end

  def partners
    partners = Record.where(user_id: current_user.id).pluck(:partner)
    render json: partners.uniq
  end

  def crags
    records = Record.where(user_id: current_user.id)
    crags = records.map { |record| record.route.crag }
    render json: crags.uniq
  end

  def areas
    records = Record.where(user_id: current_user.id)
    areas = records.map { |record| record.route.area }
    render json: areas.uniq
  end

  def collections
    collections = Collection.where(user_id: current_user.id)
    render json: collections
  end
end
