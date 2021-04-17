require "test_helper"

class EasyLoginTest < ActionDispatch::IntegrationTest
  
  test "かんたん登録" do
    get root_url
    # 失敗
    assert_no_difference "User.count" do
      post users_path, params: { user: {name: ""}}
    end
    assert_template "static_pages/home"
    assert_select "div#error_explanation"
    assert_not is_logged_in?
    assert flash[:danger]
    get root_url
    assert_nil flash[:danger]

    # 成功
    assert_difference "User.count", 1 do
      post users_path, params: { user: {name: "test_user"}}
    end
    assert_redirected_to root_url
    assert is_logged_in?
    assert flash[:success]

    # ログアウト
    delete logout_path
    assert_not is_logged_in?
    assert_redirected_to root_url
  end
end
