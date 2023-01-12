require "test_helper"

class DrugsControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get drugs_new_url
    assert_response :success
  end

  test "should get show" do
    get drugs_show_url
    assert_response :success
  end

  test "should get index" do
    get drugs_index_url
    assert_response :success
  end
end
