require "test_helper"

class PostLetterTest < ActionDispatch::IntegrationTest
  test "かんたんログイン時、投稿できる" do
    @user = easy_log_in

    assert_difference "Letter.count", 1 do
      post letters_path params: { letter: { content: "test text" } }      
    end
    assert_redirected_to root_url
    follow_redirect!
    assert_template "static_pages/home"
    assert_not_nil flash[:success]
  end

  test "内容が空だと投稿できない" do
    @user = easy_log_in
    
    assert_no_difference "Letter.count" do
      post letters_path params: { letter: { content: "" } }
    end
    assert_template "static_pages/home"
    assert_select "div#error_explanation"
  end

  test "内容が400文字以上だと投稿できない" do
    @user = easy_log_in

    assert_no_difference "Letter.count" do
      post letters_path params: { letter: { content: "a" * 401 } }
    end
  end

  test "かんたんログイン時、twitter添付ができない" do
    @user = easy_log_in
    # 登録はできるが、twitter添付は無視される
    assert_difference "Letter.count", 1 do
      post letters_path params: { letter: { content: "test text", twitter_attached: true } }
    end
    assert assigns(:letter).twitter_attached == false
  end

  test "かんたんログイン時、返信可にできない" do
    @user = easy_log_in
    # 登録はできるが、返信可は無視される
    assert_difference "Letter.count", 1 do
      post letters_path params: { letter: { content: "test text", repliable: true } }
    end
    assert assigns(:letter).repliable == false
  end

  test "かんたんログイン時、返信先を指定できない" do
    @user = easy_log_in
    # 登録はできるが、返信先は無視される
    assert_difference "Letter.count", 1 do
      post letters_path params: { letter: { content: "test text", recipient: users(:horikiri) } }
    end
    assert_nil assigns(:letter).recipient
  end
end
