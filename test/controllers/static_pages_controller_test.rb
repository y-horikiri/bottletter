require "test_helper"

class StaticPagesControllerTest < ActionDispatch::IntegrationTest
  def setup
    @base_title = "Bottletter"
  end

  test "should get home" do
    get root_url
    assert_response :success
    assert_select "title", "#{@base_title}"
  end

  test "should get policy" do
    get privacy_policy_url
    assert_response :success
    assert_select "title", "プライバシーポリシー | #{@base_title}"
  end

  test "should get terms" do
    get terms_url
    assert_response :success
    assert_select "title", "利用規約 | #{@base_title}"
  end
end
