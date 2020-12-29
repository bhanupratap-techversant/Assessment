class HealthServicesController < ApplicationController
  def index
    @health_services = HealthService
                              .filter_by(filterable_params)
                              .ordered(sortable_params)
                              .paginate(page: params[:page])

    respond_to do |format|
      format.html
      format.csv { send_data @health_services.to_csv }
    end
  end

  private

  def filterable_params
    if params[:filter].present?
      params.require(:filter).permit(:ha).reject{|_, v| v.blank?}
    else
      {}
    end
  end

  def sortable_params
    params.permit(:sort, :direction)
  end
end
