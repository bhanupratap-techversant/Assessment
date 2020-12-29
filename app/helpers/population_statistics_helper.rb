module PopulationStatisticsHelper
  def select_options_for_dimensions
    dimensions = PopulationStatistic.pluck(:dimension).uniq.map {|d| d.truncate(100)}
    dimensions.unshift("")
    options_for_select(dimensions, params.dig(:filter, :dimension))
  end
end
