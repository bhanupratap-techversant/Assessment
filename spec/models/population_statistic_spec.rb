require "rails_helper"

RSpec.describe PopulationStatistic, :type => :model do
  context "scopes" do
    let!(:ps1) { create(:population_statistic, dimension: "D1") }
    let!(:ps2) { create(:population_statistic, dimension: "D2") }

    context ".filter_by" do
      it "should return filtered records" do
        expect(PopulationStatistic.filter_by(dimension: "D1")).to match_array([ps1])
      end

      it "should return all records if no params" do
        expect(PopulationStatistic.filter_by({})).to match_array([ps1, ps2])
      end
    end

    context ".ordered" do
      it "should return ordered records" do
        expect(PopulationStatistic.ordered(sort: "dimension", direction: "asc").to_a).to eq([ps1, ps2])
        expect(PopulationStatistic.ordered(sort: "dimension", direction: "desc").to_a).to eq([ps2, ps1])
      end

      it "should return all records if no params" do
        expect(PopulationStatistic.ordered({})).to match_array([ps1, ps2])
      end

      it "should return all records if given column is not exists in model" do
        expect(PopulationStatistic.ordered({})).to match_array([ps1, ps2])
      end
    end
  end
end
