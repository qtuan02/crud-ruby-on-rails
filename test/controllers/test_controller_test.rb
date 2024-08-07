require "test_helper"

class TestControllerTest < ActionDispatch::IntegrationTest
  test "should get show" do
    get test_show_url
    assert_response :success
  end

  test "should get create" do
    get test_create_url
    assert_response :success
  end

  test "should get destroy" do
    get test_destroy_url
    assert_response :success
  end

  test "should get update" do
    get test_update_url
    assert_response :success
  end
end
