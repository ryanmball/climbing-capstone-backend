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

  # Filters
  def grades
    grades = Record.where(user_id: current_user.id).pluck(:grade)
    render json: grades.uniq.sort
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

  # Graphs
  def grades_graph_all
    grades = Record.where(user_id: current_user.id).pluck(:grade)
    grades_hash = Hash.new(0)
    grades.each { |grade| grades_hash[grade] += 1 }

    grades_hash.delete("5.5")
    grades_hash.delete("5.6")
    grades_hash.delete("5.7")
    grades_hash.delete("5.8")
    grades_hash.delete("5.9")

    grades_array = []
    grades_hash.each do |grade, num|
      grades_array << [grade, num]
    end
    grades_array.sort_by! { |grade| grade[0] }
    grades_array.unshift(["", ""])

    render json: grades_array
  end

  def grades_graph_sent
    grades = Record.where(user_id: current_user.id).where(["result = ? OR result = ? OR result = ?", "onsight", "flash", "redpoint"]).pluck(:grade)
    grades_hash = Hash.new(0)
    grades.each { |grade| grades_hash[grade] += 1 }

    grades_hash.delete("5.5")
    grades_hash.delete("5.6")
    grades_hash.delete("5.7")
    grades_hash.delete("5.8")
    grades_hash.delete("5.9")

    grades_array = []
    grades_hash.each do |grade, num|
      grades_array << [grade, num]
    end
    grades_array.sort_by! { |grade| grade[0] }
    grades_array.unshift(["", ""])

    render json: grades_array
  end

  def days_per_month
    dates = Record.where(user_id: current_user.id).pluck(:date).uniq
    dates.map! { |date| date.to_s[0..-4] }
    years = dates.map { |date| date[0..-4] }.uniq

    dates_hash2019 = { "2019-01" => 0, "2019-02" => 0, "2019-03" => 0, "2019-04" => 0, "2019-05" => 0, "2019-06" => 0, "2019-07" => 0, "2019-08" => 0, "2019-09" => 0, "2019-10" => 0, "2019-11" => 0, "2019-12" => 0 }
    dates_hash2020 = { "2020-01" => 0, "2020-02" => 0, "2020-03" => 0, "2020-04" => 0, "2020-05" => 0, "2020-06" => 0, "2020-07" => 0, "2020-08" => 0, "2020-09" => 0, "2020-10" => 0, "2020-11" => 0, "2020-12" => 0 }
    dates_hash2021 = { "2021-01" => 0, "2021-02" => 0, "2021-03" => 0, "2021-04" => 0, "2021-05" => 0, "2021-06" => 0, "2021-07" => 0, "2021-08" => 0, "2021-09" => 0, "2021-10" => 0, "2021-11" => 0, "2021-12" => 0 }
    if years.include? "2019"
      dates.each { |date| dates_hash2019[date] += 1 }
    elsif years.include? "2020"
      dates.each { |date| dates_hash2020[date] += 1 }
    elsif years.include? "2021"
      dates.each { |date| dates_hash2021[date] += 1 }
    end

    dates2019 = []
    dates_hash2019.each do |month, num|
      dates2019 << [month, num]
    end
    dates2020 = []
    dates_hash2020.each do |month, num|
      dates2020 << [month, num]
    end
    dates2021 = []
    dates_hash2021.each do |month, num|
      dates2021 << [month, num]
    end
    dates2019.unshift(["", ""])
    dates2020.unshift(["", ""])
    dates2021.unshift(["", ""])

    dates_all = { "2019" => [], "2020" => [], "2021" => [] }
    dates_all["2019"] = dates2019
    dates_all["2020"] = dates2020
    dates_all["2021"] = dates2021

    render json: dates_all
  end

  def days_per_year
    dates = Record.where(user_id: current_user.id).pluck(:date).uniq
    dates.map! { |date| date.to_s[0..-4] }
    years = dates.map { |date| date[0..-4] }.uniq

    dates_hash2019 = { "2019-01" => 0, "2019-02" => 0, "2019-03" => 0, "2019-04" => 0, "2019-05" => 0, "2019-06" => 0, "2019-07" => 0, "2019-08" => 0, "2019-09" => 0, "2019-10" => 0, "2019-11" => 0, "2019-12" => 0 }
    dates_hash2020 = { "2020-01" => 0, "2020-02" => 0, "2020-03" => 0, "2020-04" => 0, "2020-05" => 0, "2020-06" => 0, "2020-07" => 0, "2020-08" => 0, "2020-09" => 0, "2020-10" => 0, "2020-11" => 0, "2020-12" => 0 }
    dates_hash2021 = { "2021-01" => 0, "2021-02" => 0, "2021-03" => 0, "2021-04" => 0, "2021-05" => 0, "2021-06" => 0, "2021-07" => 0, "2021-08" => 0, "2021-09" => 0, "2021-10" => 0, "2021-11" => 0, "2021-12" => 0 }
    if years.include? "2019"
      dates.each { |date| dates_hash2019[date] += 1 }
    elsif years.include? "2020"
      dates.each { |date| dates_hash2020[date] += 1 }
    elsif years.include? "2021"
      dates.each { |date| dates_hash2021[date] += 1 }
    end

    days2019 = 0
    dates_hash2019.sum { |month, num| days2019+=num }
    days2020 = 0
    dates_hash2020.sum { |month, num| days2020+=num }
    days2021 = 0
    dates_hash2021.sum { |month, num| days2021+=num }

    total_days = {}
    total_days["2019"] = days2019
    total_days["2020"] = days2020
    total_days["2021"] = days2021
    render json: total_days
  end
end
