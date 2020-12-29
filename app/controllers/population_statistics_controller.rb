class PopulationStatisticsController < ApplicationController
  def index
    @population_statistics = PopulationStatistic.all.paginate(page: params[:page])
  end
end
