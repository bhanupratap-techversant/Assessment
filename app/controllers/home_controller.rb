class HomeController < ApplicationController
  def index
    # TODO: Add filters
    @population_statistics = PopulationStatistic.all
  end
end
