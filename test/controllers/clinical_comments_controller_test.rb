require "test_helper"

class ClinicalCommentsControllerTest < ActionDispatch::IntegrationTest
  test "should get create" do
    get clinical_comments_create_url
    assert_response :success
  end

  test "should get destroy" do
    get clinical_comments_destroy_url
    assert_response :success
  end
end
