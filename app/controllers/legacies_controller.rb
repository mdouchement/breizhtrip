class LegaciesController < ApplicationController
  def index
    @legacies = Legacy.all

    render json: @legacies, status: :ok
  end

  def show
    @legacy = Legacy.find(params[:id])

    render json: @legacy, status: :ok
  end
end
