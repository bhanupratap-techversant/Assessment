require "rails_helper"

RSpec.describe HealthService, :type => :model do
  context "scopes" do
    let!(:hs1) { create(:health_service, ha: "HA 1") }
    let!(:hs2) { create(:health_service, ha: "HA 2") }

    context ".filter_by" do
      it "should return filtered records" do
        expect(HealthService.filter_by(ha: "HA 1")).to match_array([hs1])
      end

      it "should return all records if no params" do
        expect(HealthService.filter_by({})).to match_array([hs1, hs2])
      end
    end

    context ".ordered" do
      it "should return ordered records" do
        expect(HealthService.ordered(sort: "ha", direction: "asc").to_a).to eq([hs1, hs2])
        expect(HealthService.ordered(sort: "ha", direction: "desc").to_a).to eq([hs2, hs1])
      end

      it "should return all records if no params" do
        expect(HealthService.ordered({})).to match_array([hs1, hs2])
      end

      it "should return all records if given column is not exists in model" do
        expect(HealthService.ordered({})).to match_array([hs1, hs2])
      end
    end
  end
end
