require "test_helper"

class ViewLetterTest < ActionDispatch::IntegrationTest
  
  def setup
    @temp = User.new(name: "test_user")
    easy_log_in_as @temp
    @user = assigns(:user)
  end

  test "自分のレター" do
    @temp = User.new(name: "test_user")
    easy_log_in_as @temp
    @user = assigns(:user)

    # letterを投稿
    assert_difference "Letter.count", 1 do
      post letters_path params: { letter: { content: "test text" } }      
    end
    @letter = assigns(:letter)
    # 自分のletterをget
    get letter_path(@letter.id)
    assert_template "letters/show"
    assert_match @letter.content, response.body
    assert_select "span.delete"
  end

  test "自分以外のレター" do
    @temp = User.new(name: "test_user")
    easy_log_in_as @temp
    @user = assigns(:user)

    @letter = letters(:letter2)
    get letter_path(@letter)
    assert_template "letters/show"
    assert_match @letter.content, response.body
    assert_select "span.delete", count: 0  
  end

  test "非ログイン状態" do
    @letter = letters(:letter2)
    get letter_path(@letter)
    assert_template "letters/show"
    assert_match @letter.content, response.body
    assert_select "span.delete", count: 0  
  end
end
