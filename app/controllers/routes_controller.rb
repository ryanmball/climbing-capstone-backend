class RoutesController < ApplicationController
  def index
    render json: Route.all.order(:id)
  end
end
