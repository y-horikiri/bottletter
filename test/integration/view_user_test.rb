require "test_helper"

class ViewUserTest < ActionDispatch::IntegrationTest
  include ApplicationHelper

  def setup
    @user = users(:horikiri)
  end

  test "userページ表示, letterのpaginate" do
    get user_path(@user)
    assert_template("users/show")
    assert_select "title", full_title(@user.name)
    assert_select "h1", text: @user.name
    assert_match @user.letters.count.to_s, response.body
    assert_select "div.pagination", count: 1
    @user.letters.paginate(page: 1).each do |letter|
      assert_select "a[href=?]", letter_path(letter)
      assert_match Rinku.auto_link(letter.content), response.body
    end
  end
end
