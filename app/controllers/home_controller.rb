class HomeController < ApplicationController
  def index
    # TODO: Add filters
    @population_statistics = PopulationStatistic.all.paginate(page: params[:page])
  end
end
