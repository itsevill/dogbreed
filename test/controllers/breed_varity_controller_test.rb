require "test_helper"

class BreedVarityControllerTest < ActionDispatch::IntegrationTest
  test "should get show" do
    get breed_varity_show_url
    assert_response :success
  end
end
