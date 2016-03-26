class LegaciesView
  attr_reader :search_params, :params

  def self.call(search_params, params)
    new(search_params, params).call
  end

  def initialize(search_params, params)
    @search_params = search_params
    @params = params
  end

  def call
    sort Legacy.where(search_params)
  end

  private

  def sort(legacies)
    return legacies unless valid_sort_params?
    legacies.order(params[:order_by] => params[:order_type])
  end

  def valid_sort_params?
    Legacy.attribute_names.map(&:to_s).include?(params[:order_by]) &&
      %w(asc desc).include?(params[:order_type])
  end
end
