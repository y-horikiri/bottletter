require "test_helper"

class LettersControllerTest < ActionDispatch::IntegrationTest
  
  def setup
    @letter = letters(:hello)
  end
  
  test "create時ログインしていない場合はリダイレクトする" do
    assert_no_difference "Letter.count" do
      post letters_path, params: { letter: { content: "hello" } }
    end
    assert_redirected_to root_url
  end

  test "destroy時ログインしていない場合はリダイレクトする" do
    assert_no_difference "Letter.count" do
      delete letter_path(@letter)
    end
    assert_redirected_to root_url
  end
  
  test "自分以外のユーザーのletterは削除できない" do
    easy_log_in
    letter = letters(:oraora)
    assert_no_difference "Letter.count" do
      delete letter_path(letter)
    end
    assert_redirected_to root_url
  end
  
end
