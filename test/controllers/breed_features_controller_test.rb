require "test_helper"

class BreedFeaturesControllerTest < ActionDispatch::IntegrationTest
  test "should get show" do
    get breed_features_show_url
    assert_response :success
  end
end
