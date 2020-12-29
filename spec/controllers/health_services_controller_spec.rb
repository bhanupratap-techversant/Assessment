require "rails_helper"

RSpec.describe HealthServicesController, type: :controller do
  login_user

  describe "GET index" do
    let!(:health_services) { create_list(:health_service, 2) }

    it "assigns @health_services" do
      get :index
      expect(assigns(:health_services)).to eq(health_services)
    end

    it "filters the health_services" do
      ha = health_services.first.ha
      params = ActionController::Parameters.new({filter: {ha: ha}})
      expected_health_services = HealthService.where(ha: ha)

      expect(HealthService).to receive(:filter_by).with(params.require(:filter).permit(:ha)).and_return(expected_health_services)
      get :index, params: {filter: {ha: ha}}
    end

    it "order the health_services" do
      params = ActionController::Parameters.new({sort: "ha", direction: "asc"})
      expected_health_services = HealthService.order(ha: :asc)

      expect(HealthService).to receive(:ordered).with(params.permit(:sort, :direction)).and_return(expected_health_services)
      get :index, params: {sort: "ha", direction: "asc"}
    end

    context "with html format" do
      it "renders the index template" do
        get :index
        expect(response).to render_template("index")
      end
    end

    context "with csv format" do
      it "renders the CSV file" do
        get :index, params: {format: :csv}
        expect(response.header['Content-Type']).to eq("application/octet-stream")
        expect(response.header['Content-Disposition']).to eq("attachment")
      end
    end
  end
end
