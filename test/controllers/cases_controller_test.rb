require "test_helper"

class CasesControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get cases_new_url
    assert_response :success
  end

  test "should get index" do
    get cases_index_url
    assert_response :success
  end

  test "should get show" do
    get cases_show_url
    assert_response :success
  end
end
