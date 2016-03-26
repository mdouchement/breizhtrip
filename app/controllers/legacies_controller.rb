class LegaciesController < ApplicationController
  def index
    @legacies = LegaciesView.call(search_params, params)

    render json: @legacies, status: :ok
  end

  def show
    @legacy = Legacy.find(params[:id])

    render json: @legacy, status: :ok
  end

  private

  def search_params
    params.permit(Legacy.attribute_names.map(&:to_sym))
  end
end
