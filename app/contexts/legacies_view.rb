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
    @legacies = Legacy
    if (filtred = Legacy.where(like_clauses)).present?
      @legacies = filtred
    end
    area_filter
    sort_filter
    @legacies.is_a?(Legacy) ? Legacy.all : @legacies
  end

  private

  def sort_filter
    return unless valid_sort_params?
    @legacies = @legacies.order(params[:order_by] => params[:order_type])
  end

  def valid_sort_params?
    Legacy.attribute_names.map(&:to_s).include?(params[:order_by]) &&
      %w(asc desc).include?(params[:order_type])
  end

  def area_filter
    lo = params[:longitude]&.to_f
    la = params[:latitude]&.to_f
    ra = params[:radius]&.to_f
    return unless lo && la && ra
    @legacies = @legacies.where("|/( (#{la} - latitude)^2.0 + (#{lo} - longitude)^2.0 ) <= #{ra} / 111000")
  end

  def like_clauses
    [' id IS NOT NULL '].tap do |query|
      search_params.each do |k, v|
        query << " #{k} ILIKE '%#{v}%' "
      end
    end.join('AND')
  end
end
