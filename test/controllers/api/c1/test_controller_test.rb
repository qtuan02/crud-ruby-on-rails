require "test_helper"

class Api::C1::TestControllerTest < ActionDispatch::IntegrationTest
  test "should get show" do
    get api_c1_test_show_url
    assert_response :success
  end

  test "should get create" do
    get api_c1_test_create_url
    assert_response :success
  end

  test "should get destroy" do
    get api_c1_test_destroy_url
    assert_response :success
  end

  test "should get update" do
    get api_c1_test_update_url
    assert_response :success
  end
end
