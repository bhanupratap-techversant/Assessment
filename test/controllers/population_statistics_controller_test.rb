require 'test_helper'

class PopulationStatisticsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get population_statistics_index_url
    assert_response :success
  end

end
