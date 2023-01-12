require "test_helper"

class ProgressesControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get progresses_new_url
    assert_response :success
  end

  test "should get show" do
    get progresses_show_url
    assert_response :success
  end

  test "should get index" do
    get progresses_index_url
    assert_response :success
  end

  test "should get destroy" do
    get progresses_destroy_url
    assert_response :success
  end
end
