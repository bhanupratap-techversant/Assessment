require "rails_helper"

RSpec.describe PopulationStatisticsController, type: :controller do
  login_user

  describe "GET index" do
    let!(:population_statistics) { create_list(:population_statistic, 2) }

    it "assigns @population_statistics" do
      get :index
      expect(assigns(:population_statistics)).to eq(population_statistics)
    end

    it "filters the population_statistics" do
      dimension = population_statistics.first.dimension
      params = ActionController::Parameters.new({filter: {dimension: dimension}})
      expected_population_statistics = PopulationStatistic.where(dimension: dimension)

      expect(PopulationStatistic).to receive(:filter_by).with(params.require(:filter).permit(:dimension)).and_return(expected_population_statistics)
      get :index, params: {filter: {dimension: dimension}}
    end

    it "order the population_statistics" do
      params = ActionController::Parameters.new({sort: "dimension", direction: "asc"})
      expected_population_statistics = PopulationStatistic.order(dimension: :asc)

      expect(PopulationStatistic).to receive(:ordered).with(params.permit(:sort, :direction)).and_return(expected_population_statistics)
      get :index, params: {sort: "dimension", direction: "asc"}
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
