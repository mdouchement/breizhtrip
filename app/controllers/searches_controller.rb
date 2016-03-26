class SearchesController < ApplicationController
  def index
    @legacies = LegacyView.call(params)

    render json: @legacies, status: :ok
  end
end
