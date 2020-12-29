class PopulationStatisticsController < ApplicationController
  def index
    @population_statistics = PopulationStatistic
                              .filter_by(filterable_params)
                              .ordered(sortable_params)
                              .paginate(page: params[:page])

    respond_to do |format|
      format.html
      format.csv { send_data @population_statistics.to_csv }
    end
  end

  private

  def filterable_params
    if params[:filter].present?
      params.require(:filter).permit(:dimension).reject{|_, v| v.blank?}
    else
      {}
    end
  end

  def sortable_params
    params.permit(:sort, :direction)
  end
end
