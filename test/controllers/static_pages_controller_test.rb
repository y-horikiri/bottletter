require "test_helper"

class StaticPagesControllerTest < ActionDispatch::IntegrationTest
  test "should get home" do
    get root_url
    assert_response :success
  end

  test "should get policy" do
    get privacy_policy_url
    assert_response :success
  end

  test "should get terms" do
    get terms_url
    assert_response :success
  end
end
