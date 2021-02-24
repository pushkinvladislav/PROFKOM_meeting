require "test_helper"

class DashboardControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get dashboard_index_url
    assert_response :success
  end

  test "should get events" do
    get dashboard_events_url
    assert_response :success
  end

  test "should get students" do
    get dashboard_students_url
    assert_response :success
  end
end
