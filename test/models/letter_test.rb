require "test_helper"

class LetterTest < ActiveSupport::TestCase
  
  def setup
    @horikiri = users(:horikiri)
    @letter1 = letters(:hello)
  end

  test "validである" do
    assert @letter1.valid?
  end

  test "ユーザーに属している" do
    @letter1.user_id = nil
    assert_not @letter1.valid?
  end

  test "contentはnot null" do
    @letter1.content = nil
    assert_not @letter1.valid?
    @letter1.content = ""
    assert_not @letter1.valid?
    @letter1.content = " "
    assert_not @letter1.valid?
  end

  test "repliableはnot null" do
    @letter1.repliable = nil
    assert_not @letter1.valid?
  end
  
  test "twitter_attachedはnot null" do
    @letter1.twitter_attached = nil
    assert_not @letter1.valid?
  end

  test "未認証の場合repliableはtrue不可" do
    @letter1.user.authenticated = false
    @letter1.repliable = true
    assert_not @letter1.valid?
  end
  
  test "twitter未連携の場合twitter_attachedはtrue不可" do
    @letter1.user.twitter_id = nil
    @letter1.twitter_attached = true
    assert_not @letter1.valid?
  end
  

end
