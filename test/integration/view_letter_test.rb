require "test_helper"

class ViewLetterTest < ActionDispatch::IntegrationTest
  
  def setup; end

  test "自分のレター" do
    @user = easy_log_in

    # letterを投稿
    post letters_path params: { letter: { content: "test text" } }      
    @letter = assigns(:letter)
    # 自分のletterをget
    get letter_path(@letter.id)
    assert_template "letters/show"
    assert_match @letter.content, response.body
    assert_select "span.delete"
  end

  test "自分以外のレター" do
    @user = easy_log_in

    @letter = letters(:oraora)
    get letter_path(@letter)
    assert_template "letters/show"
    assert_match @letter.content, response.body
    assert_select "span.delete", count: 0  
  end

  test "非ログイン状態" do
    @letter = letters(:oraora)
    get letter_path(@letter)
    assert_template "letters/show"
    assert_match @letter.content, response.body
    assert_select "span.delete", count: 0  
  end
end
