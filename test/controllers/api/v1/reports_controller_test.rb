require "test_helper"

class Api::V1::ReportsControllerTest < ActionDispatch::IntegrationTest
  test "should get create" do
    get api_v1_reports_create_url
    assert_response :success
  end
end
