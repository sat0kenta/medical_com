require "test_helper"

class ClinicalsControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get clinicals_new_url
    assert_response :success
  end

  test "should get index" do
    get clinicals_index_url
    assert_response :success
  end

  test "should get show" do
    get clinicals_show_url
    assert_response :success
  end
end
